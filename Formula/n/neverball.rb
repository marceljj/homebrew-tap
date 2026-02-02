class Neverball < Formula
  version "1.7.0-alpha.3"
  desc "Tilt the floor to roll a ball through an obstacle course before time runs out (plus Neverputt)"
  homepage "https://neverball.org"
  url "https://github.com/Neverball/neverball/archive/refs/tags/#{version}.tar.gz"
  sha256 "8b3c6397038e179dae3cadeedbf0dc71ef27f54db6bcadca1d4bb1150804c68f"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "gettext"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "libvorbis"
  depends_on "sdl2"
  depends_on "sdl2_net"
  depends_on "sdl2_ttf"
  
  on_macos do
    depends_on "curl"
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
    doc.install Dir["doc/*"]
    
    (share/"applications").install "dist/neverball.desktop.in" => "neverball.desktop"
    (share/"applications").install "dist/neverputt.desktop.in" => "neverputt.desktop"
    (share/"icons/hicolor/16x16/apps").install "dist/neverball_16.png" => "neverball.png"
    (share/"icons/hicolor/16x16/apps").install "dist/neverputt_16.png" => "neverputt.png"
    (share/"icons/hicolor/24x24/apps").install "dist/neverball_24.png" => "neverball.png"
    (share/"icons/hicolor/24x24/apps").install "dist/neverputt_24.png" => "neverputt.png"
    (share/"icons/hicolor/32x32/apps").install "dist/neverball_32.png" => "neverball.png"
    (share/"icons/hicolor/32x32/apps").install "dist/neverputt_32.png" => "neverputt.png"
    (share/"icons/hicolor/48x48/apps").install "dist/neverball_48.png" => "neverball.png"
    (share/"icons/hicolor/48x48/apps").install "dist/neverputt_48.png" => "neverputt.png"
    (share/"icons/hicolor/64x64/apps").install "dist/neverball_64.png" => "neverball.png"
    (share/"icons/hicolor/64x64/apps").install "dist/neverputt_64.png" => "neverputt.png"
    (share/"icons/hicolor/128x128/apps").install "dist/neverball_128.png" => "neverball.png"
    (share/"icons/hicolor/128x128/apps").install "dist/neverputt_128.png" => "neverputt.png"
    (share/"icons/hicolor/256x256/apps").install "dist/neverball_256.png" => "neverball.png"
    (share/"icons/hicolor/256x256/apps").install "dist/neverputt_256.png" => "neverputt.png"
    (share/"icons/hicolor/512x512/apps").install "dist/neverball_512.png" => "neverball.png"
    (share/"icons/hicolor/512x512/apps").install "dist/neverputt_512.png" => "neverputt.png"
    (share/"metainfo").install "dist/neverball.appdata.xml"
  end

  test do
    system "false"
  end
end
