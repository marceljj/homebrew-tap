class Uxplay < Formula
  desc 'AirPlay Unix mirroring server'
  version "1.72.3"
  homepage "https://github.com/FDH2/UxPlay"
  url "https://github.com/FDH2/UxPlay/archive/refs/tags/v#{version}.tar.gz"
  sha256 "a2f41c5481c2c3c8f125c38f8142a99d69b21d727be816616b66dd96af9a9c63"
  license "GPL-3.0"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gstreamer"
  depends_on "libplist"
  depends_on "openssl@3"
  
  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
