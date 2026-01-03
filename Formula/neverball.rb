class Neverball < Formula
  version "1.7.0-alpha.3"
  desc "Tilt the floor to roll a ball through an obstacle course before time runs out (plus Neverputt)"
  homepage "https://neverball.org"
  url "https://github.com/Neverball/neverball/archive/refs/tags/#{version}.tar.gz"
  sha256 "8b3c6397038e179dae3cadeedbf0dc71ef27f54db6bcadca1d4bb1150804c68f"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "curl"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "libvorbis"
  depends_on "sdl2"
  depends_on "sdl2_net"
  depends_on "sdl2_ttf"
  
  on_macos do
    depends_on "gettext"
  end
  
  def install
    inreplace "share/font.c", "<SDL_ttf.h>", "<SDL2/SDL_ttf.h>"
    inreplace "share/font.h", "<SDL_ttf.h>", "<SDL2/SDL_ttf.h>"
    inreplace "share/image.c", "<SDL_ttf.h>", "<SDL2/SDL_ttf.h>"
    inreplace "share/image.h", "<SDL_ttf.h>", "<SDL2/SDL_ttf.h>"
    
    system "make", "DATADIR=#{share}/data", "LOCALEDIR=#{share}/locale"
    bin.install "mapc"
    bin.install "neverball"
    bin.install "neverputt"
    share.install "data"
    share.install "locale"
    
    man1.install "dist/mapc.1"
    man6.install "dist/neverball.6"
    man6.install "dist/neverputt.6"
    (share/"metainfo").install "dist/neverball.appdata.xml"
    (share/"applications").install "dist/neverball.desktop.in" => "neverball.desktop"
    (share/"applications").install "dist/neverputt.desktop.in" => "neverputt.desktop"
  end

  test do
    system "false"
  end
end
