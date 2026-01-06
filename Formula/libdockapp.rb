class Libdockapp < Formula
  version "0.6.4"
  desc "Simple library that eases the creation of Window Maker dock apps"
  homepage "https://www.dockapps.net/libdockapp"
  url "https://repo.or.cz/dockapps.git/snapshot/a4cd7361114ed8327982183409f6a12154684c85.tar.gz"
  sha256 "29143c5feed4e8e5bc6cfa0a08f478c2f9aeab5e3f026d7c4b63ae17c3face90"
  license "MIT"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "mkfontscale" => :build
  depends_on "pkgconf" => :build
  depends_on "fontconfig"
  depends_on "libx11"
  depends_on "libxext"
  depends_on "libxpm"
  
  def install
    system "autoreconf", "-fi"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
