class TdLib < Formula
  version "12.1"
  desc "Tom Dickey's UNIX library"
  homepage "https://invisible-island.net"
  url "https://invisible-island.net/datafiles/release/td_lib.tar.gz"
  sha256 "8854186a30eb4fd842397f54afe9309bfa53607bf60a9cf8e0b2a6b7231a35a3"
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
