class TdLib < Formula
  version "12.1"
  desc "Tom Dickey's UNIX library"
  homepage "https://invisible-island.net"
  url "https://invisible-island.net/datafiles/release/td_lib.tar.gz"
  license "MIT"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
