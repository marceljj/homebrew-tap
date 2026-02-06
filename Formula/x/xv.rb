class Xv < Formula
  version "6.1.0"
  desc "An interactive image manipulation program for the X Window System"
  homepage "https://xv.trilon.com"
  url "https://github.com/jasper-software/xv/releases/download/v#{version}/xv-3.10a-js-#{version}.tar.gz"
  sha256 "bfd0df563a7d5e6632fd22a4789d6a2e5ec24c83027d058a563eebc6dc74ca9c"
  license "XV"

  depends_on "cmake" => :build
  depends_on "jasper"
  depends_on "jpeg-turbo"
  depends_on "libdeflate"
  depends_on "libexif"
  depends_on "libmd"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "libx11"
  depends_on "libxau"
  depends_on "libxcb"
  depends_on "libxdmcp"
  depends_on "libxrender"
  depends_on "libxrandr"
  depends_on "libxt"
  depends_on "webp"
  
  def install
    system "cmake", "-S", ".", "-B", "build-cmake", *std_cmake_args
    system "cmake", "--build", "build-cmake"
    system "cmake", "--install", "build-cmake"
  end

  test do
    system "false"
  end
end
