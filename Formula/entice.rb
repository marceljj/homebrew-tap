class Entice < Formula
  version "0.0.1"
  desc "A simple image viewer, based on the EFL"
  homepage "https://git.enlightenment.org/vtorri/entice"
  url "https://git.enlightenment.org/vtorri/entice/releases/download/v#{version}/entice-#{version}.tar.gz"
  sha256 "962301f9e6b531ecdcaf87e99c8423779a7339e9bdec5b67acf94ed249054e11"
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
