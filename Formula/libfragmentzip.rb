class Libfragmentzip < Formula
  version "76"
  desc "A library allowing to download single files from a remote zip archive"
  homepage "https://github.com/tihmstar/libfragmentzip"
  url "https://github.com/tihmstar/libfragmentzip/archive/refs/tags/#{version}.tar.gz"
  sha256 "4859dce6ce4e16addda962fa65a51aa050d7644e1e74b665d04550fcc1ffc055"
  license "LGPL-3.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  
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
