class Libsrt < Formula
  version "git-2021.09"
  desc "A C library for writing fast and safe C code, faster"
  homepage "https://github.com/faragon/libsrt"
  url "https://github.com/faragon/libsrt.git", branch: "master"
  license "BSD-3-Clause"
  
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  
  def install
    system "autoreconf", "-fi"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "check"
  end
end
