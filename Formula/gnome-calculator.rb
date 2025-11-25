class Gnomecalculator < Formula
  desc "Calculator for solving mathematical equations"
  homepage "https://apps.gnome.org//Calculator/"
  url "https://gitlab.gnome.org/GNOME/gnome-calculator/-/archive/49.2/gnome-calculator-49.2.tar.gz"
  version "49.2"
  sha256 "ddb5410091c841d4e93c61570c4e5a68e5c7d0f2ae19ea81be8fd8d29255b9ca"

  depends_on "meson"
  depends_on "python"
  depends_on "vala"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "itstool"
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "gtksourceview5"

  def install
    args = %w[
        -Ddoc=false
        ]

        system "meson", "setup", "build", *args, *std_meson_args
        system "meson", "compile", "-C", "build", "--verbose"
        system "meson", "install", "-C", "build"
  end

  test do
    system "false"
  end
end
