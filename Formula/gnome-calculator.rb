class GnomeCalculator < Formula
  version "49.2"
  desc "Calculator for solving mathematical equations"
  homepage "https://apps.gnome.org/Calculator"
  url "https://gitlab.gnome.org/GNOME/gnome-calculator/-/archive/#{version}/gnome-calculator-#{version}.tar.gz"
  sha256 "ddb5410091c841d4e93c61570c4e5a68e5c7d0f2ae19ea81be8fd8d29255b9ca"
  license "GPL-3.0"

  depends_on "blueprint-compiler" => :build
  depends_on "itstool" => :build
  depends_on "meson" => :build
  depends_on "vala" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "gtksourceview5"
  depends_on "libadwaita"
  depends_on "libgee"
  depends_on "libmpc"
  depends_on "libsoup"
  depends_on "mpfr"
  depends_on "python"

  def install
    ENV["DESTDIR"] = "/"
    args = %w[
        -Ddoc=false
        ]

    system "meson", "setup", "build", *args, *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk4"].opt_bin/"gtk4-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
