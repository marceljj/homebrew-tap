class Chrzaszcz < Formula
  version "0.1.3"
  desc "An SDL2 based maze-game"
  homepage "https://sourceforge.net/projects/chrzaszcz"
  url "https://downloads.sourceforge.net/project/chrzaszcz/chrzaszcz-#{version}.tar.gz"
  sha256 "1c81dbdcc731bbcb37a71b34205b86717b3fa6d8c8ac1ac6d1e525e417bfeb15"
  license "GPL-3.0"

  depends_on "pkgconf" => :build
  depends_on "sdl2"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
