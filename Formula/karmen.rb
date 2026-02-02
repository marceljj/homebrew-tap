class Karmen < Formula
  version "0.15"
  desc "A Window Manager for X"
  homepage "https://karmen.sourceforge.net"
  url "https://downloads.sourceforge.net/project/karmen/karmen/#{version}/karmen-#{version}.tar.gz"
  sha256 "7eebdef9b14a4f56242764d102c5a30507a97967f1507457e44ec4b775762e42"
  license "MIT"

  depends_on "libx11"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
