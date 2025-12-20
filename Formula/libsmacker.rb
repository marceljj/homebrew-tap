class Libsmacker < Formula
  version "1.1.1r35"
  shortversion "1.1"
  desc "A cross-platform C library which can be used for decoding Smacker Video files produced by RAD Game Tools"
  homepage "https://libsmacker.sourceforge.net"
  url "https://downloads.sourceforge.net/project/libsmacker/libsmacker-#{shortversion}/libsmacker-#{version}.tar.gz"
  sha256 "bb9c22c02ecda189a3389c9340a0eb6a8f287aa257099b54c3d9e1802a454630"
  license "LGPL-2.1"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "autoreconf", "-fi"
    system "autoupdate"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
    bin.install "./.libs/smk2avi"
    include.install "smacker.h"
    doc.install "COPYING"
    doc.install "README"
  end

  test do
    system "false"
  end
end
