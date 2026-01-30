class Elimine < Formula
  version "2025.08"
  desc "A simple minesweeper which mimics the old mine sweeper on Windows XP, written with the EFL"
  homepage "https://git.enlightenment.org/vtorri/entice"
  url "https://git.enlightenment.org/vtorri/elimine.git", branch: "master"
  license "MIT"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "efl"

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
