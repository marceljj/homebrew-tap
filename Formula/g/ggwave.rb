class Ggwave < Formula
  desc "Tiny data-over-sound library"
  version "1.5.2"
  homepage "https://github.com/ggerganov/ggwave"
  url "https://github.com/ggerganov/ggwave/archive/refs/tags/waver-v#{version}.tar.gz"
  sha256 "3f5498de9eda8ea7dcbb3cde34f3916f91ded38de276df428f6af9c6b14eee0b"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "sdl2"
  
  def install
    system "cmake", "-S", ".", "-B", "build", "-DCMAKE_POLICY_VERSION_MINIMUM=3.5", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
