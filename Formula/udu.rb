class Udu < Formula
  version "0.6.91"
  desc "Extremely fast command-line disk usage analyzer"
  homepage "https://github.com/gnualmalki/udu"
  url "https://github.com/gnualmalki/udu/archive/refs/tags/udu@#{version}.tar.gz"
  sha256 "7035f9fb518b2cb2ab4d9b5ba3e56c1a75cda1b98e07a2fbb66c9935d61d57e6"
  license "GPL-3.0-or-later"

  depends_on "libomp"
  
  def install
    inreplace "Makefile", "-include omp.mk", ""
    system "make", "CFLAGS=-fopenmp", "LDFLAGS=-fopenmp", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
