class Libfragmentzip < Formula
  version "76"
  desc "A library allowing to download single files from a remote zip archive"
  homepage "https://github.com/tihmstar/libfragmentzip"
  url "https://github.com/tihmstar/libfragmentzip/archive/refs/tags/#{version}.tar.gz"
  sha256 "93ab1d7bbef79ad4fe3205eb7d7daa19338e1e72d433059413750674ba0cfe90"
  license "LGPL-3.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  
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
