class Nrsc5 < Formula
  desc "NRSC-5 receiver for rtl-sdr"
  version "3.1.0"
  homepage "http://theori.io/research/nrsc-5-c"
  url "https://github.com/theori-io/nrsc5/archive/refs/tags/v#{version}.tar.gz"
  sha256 "66a1d199e92fd7b9464d55ece633757cb9d1daf37d4d80e0f4f8f63da089295e"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "fftw"
  depends_on "librtlsdr"
  depends_on "libao"
  
  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
