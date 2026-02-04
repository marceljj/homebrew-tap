class Libposit < Formula
  version "1.0.2"
  desc "Posit arithmetic C99 implementation"
  homepage "https://github.com/takum-arithmetic/libposit"
  url "https://github.com/takum-arithmetic/libposit/archive/refs/tags/v#{version}.tar.gz"
  sha256 "4daa502a714b719ce5b3a0c76888cae73cbcebe0e7d487386f1343d5552cf217"
  license "ISC"

  def install
    inreplace "config.mk", "/usr/local", "#{prefix}"

    system "./configure"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
