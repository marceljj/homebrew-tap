class Uxplay < Formula
  desc 'AirPlay Unix mirroring server'
  version "1.72.3"
  homepage "https://github.com/FDH2/UxPlay"
  url "https://github.com/FDH2/UxPlay/archive/refs/tags/v#{version}.tar.gz"
  sha256 "a2f41c5481c2c3c8f125c38f8142a99d69b21d727be816616b66dd96af9a9c63"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gstreamer"
  depends_on "libplist"
  depends_on "openssl@3"
  
  def install
    on_macos do
      inreplace "uxplay.1" do |s|
        s.gsub! "; (hardware) v4l2h264dec,", ";"
        s.gsub! "nvdec,", "(hardware) nvdec,"
        s.gsub! "Use Video4Linux2 for GPU hardware h264 video decoding.", "Disabled on this system."
      end
      inreplace "uxplay.cpp" do |s|
        s.gsub! "(hardware) v4l2h264dec", "(hardware) nvdec"
        s.gsub! "nvdec, nvh264dec", "nvh264dec"
        s.gsub! "nvh264dec,v4l2h264dec", "nvh264dec"
        s.gsub! "printf(/"          another choice when using v4l2h264dec: v4l2convert\n/");", ""
        s.gsub! "printf(/"-v4l2     Use Video4Linux2 for GPU hardware h264 decoding\n/");", ""
    end
    
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "uxplay", "-h"
  end
end
