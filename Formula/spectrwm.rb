class Spectrwm < Formula
  version "3.7.0"
  desc "A small dynamic tiling window manager for X11"
  homepage "https://github.com/conformal/spectrwm"
  url "https://github.com/conformal/spectrwm/archive/refs/tags/SPECTRWM_3_7_0.tar.gz"
  sha256 "9541ceb713dd186755643a85b03e9ebe98b9703b00025d229ee92a6ba910c805"
  license "ISC"

  depends_on "fontconfig"
  depends_on "libx11"
  depends_on "libxcb"
  depends_on "libxcursor"
  depends_on "libxft"

  def install
    Dir.chdir("osx") do
      system "make", "PREFIX=#{prefix}"
      system "make", "install", "PREFIX=#{prefix}"
    end
  end
  
  test do
    system "false"
  end
end
