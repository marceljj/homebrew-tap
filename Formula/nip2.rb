class Nip2 < Formula
  version "8.9.1"
  desc "A spreadsheet-like GUI for libvips"
  homepage "https://github.com/libvips/nip2"
  url "https://github.com/libvips/nip2/releases/download/v#{version}/nip2-#{version}.tar.gz"
  sha256 "b75e26eb3fb994faa988e8e07436cac2a4965c2cab08bef3968e817a866d76cd"
  license "GPL-2.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "glib"
  
  def install
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
