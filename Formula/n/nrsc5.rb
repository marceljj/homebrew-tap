class Nrsc5 < Formula
  desc "NRSC-5 receiver for rtl-sdr"
  version "3.1.0"
  homepage "https://github.com/theori-io/nrsc5"
  url "https://github.com/theori-io/nrsc5/archive/refs/tags/v#{version}.tar.gz"
  sha256 "66a1d199e92fd7b9464d55ece633757cb9d1daf37d4d80e0f4f8f63da089295e"
  license "GPL-3.0-or-later"

  depends_on "git" => :build
  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "pkgconf" => :build
  depends_on "fftw"
  depends_on "librtlsdr"
  depends_on "libao"
  
  def install
    args = %w[
      -DBUILD_DOC=ON
    ]
    
    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
    doc.install Dir["build/doc_doxygen/html"]
  end

  test do
    system "nrsc5", "-v"
  end
end
