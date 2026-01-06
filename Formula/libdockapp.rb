class Libdockapp < Formula
  version "0.6.4"
  desc "imple library that eases the creation of Window Maker dock apps"
  homepage "https://www.dockapps.net/libdockapp"
  url "https://repo.or.cz/dockapps.git/snapshot/a4cd7361114ed8327982183409f6a12154684c85.tar.gz"
  sha256 "d44f4ffccbdf0981bb2a754d2cf14e5515cf4a9893d0a4769ffc8499aedf2bd3"
  license "MIT"

  depends_on "autoconf" => :build
  depends_on "pkgconf" => :build
  depends_on "libx11"
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
