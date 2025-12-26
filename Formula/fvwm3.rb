class Fvwm3 < Formula
  version "1.1.4"
  desc "A virtual window manager for the X windows system"
  homepage "https://www.fvwm.org"
  url "https://github.com/fvwmorg/fvwm3/releases/download/#{version}/fvwm3-#{version}.tar.gz"
  sha256 "6df420ab492dcecd9d302880a9e97f689e9181db8850f5f7945e652bb8dd62a0"
  license all_of: ["GPL-2.0", "fvwm"]

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "fribidi"
  depends_on "freetype"
  depends_on "libiconv"
  depends_on "libpng"
  depends_on "librsvg"
  depends_on "libx11"
  depends_on "libxcursor"
  depends_on "libxfixes"
  depends_on "libxpm"
  depends_on "libxrender"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "false"
  end
end
