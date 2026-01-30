class Equate < Formula
  version "2017.08"
  desc "A calculator based on EFL"
  homepage "https://git.enlightenment.org/vtorri/equate"
  url "https://git.enlightenment.org/vtorri/equate.git", branch: "master"
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
