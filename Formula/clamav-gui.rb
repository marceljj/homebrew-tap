class ClamavGui < Formula
  version "1.1.8"
  desc "Calculator for solving mathematical equations"
  homepage "https://github.com/wusel1007/clamav-gui"
  url "https://github.com/wusel1007/clamav-gui/archive/refs/tags/v#{version}.tar.gz"
  sha256 "1e4a85618a8b681a834097fc87af78d1ba3ef892d7e31080506d989903826d9a"
  license "GPL-3.0"

  depends_on "cmake" => :build
  depends_on "clamav"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
