class Ded < Formula
  version "12.0"
  desc "A directory editor for UNIX systems"
  homepage "https://invisible-island.net/ded"
  url "https://invisible-island.net/datafiles/release/ded.tar.gz"
  license "MIT"

  depends_on "td-lib"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
