class Vtwm < Formula
  version "5.5.0"
  desc "Virtual Tab Window Manager for the X Window System"
  homepage "http://www.vtwm.org"
  url "http://sourceforge.net/projects/vtwm/files/vtwm-#{version}.tar.gz"
  sha256 "448d7afd8d5a5fcfabf1b9c64b811cfa6bdbf8892c067fe01a141806ef61eaf4"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "libx11"
  depends_on "libxext"
  depends_on "libxmu"
  depends_on "libxt"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end
  
  test do
    system "false"
  end
end
