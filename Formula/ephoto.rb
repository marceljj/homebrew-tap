class Ephoto < Formula
  version "1.6.0"
  desc "A comprehensive image viewer written using the core EFL"
  homepage "https://git.enlightenment.org/enlightenment/ephoto"
  url "https://git.enlightenment.org/enlightenment/ephoto.git", branch: "master"
  license "BSD-2-Clause"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "efl"
  depends_on "libexif"
  
  on_macos do
    depends_on "gettext"
  end

  def install
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "false"
  end
end
