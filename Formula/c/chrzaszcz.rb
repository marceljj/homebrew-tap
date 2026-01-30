class Chrzaszcz < Formula
  version "0.1.3"
  desc "An SDL2 based maze-game"
  homepage "https://sourceforge.net/projects/chrzaszcz"
  url "https://downloads.sourceforge.net/project/chrzaszcz/chrzaszcz-#{version}.tar.gz"
  sha256 "b3c9f01cf923ccf47ba02e0f3f7bfcf0f2e9020938bff5a95f8815cb4039a5e7"
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
