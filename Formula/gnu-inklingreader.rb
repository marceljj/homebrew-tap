class GnuInklingreader < Formula
  desc "An attempt to create a GNU-friendly version of the Wacom Inkling SketchManager"
  version "0.8"
  homepage "https://www.gnu.org/software/inklingreader"
  url "https://alpha.gnu.org/gnu/inklingreader/inklingreader-#{version}.tar.gz"
  sha256 "cf24fadff065f2a60c8521bd23f6c64c311f5b7573ff46f002103bfe6a496f46"
  license "GPL-3.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "librsvg"
  depends_on "libusb"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "none"
  end
end
