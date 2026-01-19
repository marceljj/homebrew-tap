class Gnome2048 < Formula
  version "50.alpha.2"
  desc "A 2048-like game for GNOME"
  homepage "https://gitlab.gnome.org/GNOME/gnome-2048"
  url "https://gitlab.gnome.org/GNOME/gnome-2048/-/archive/#{version}/gnome-2048-#{version}.tar.gz"
  sha256 "662aa92742d2390b4c1c432fbbbc28a9ac3c8b79e7f59cab34024bf0bcbf99c4"
  license "GPL-3.0-or-later"

  depends_on "desktop-file-utils" => :build
  depends_on "itstool" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "vala" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "libgnome-games-support"

  def install
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system Formula["desktop-file-utils"].opt_bin/"desktop-file-validate", HOMEBREW_PREFIX/"share/applications"
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk4"].opt_bin/"gtk4-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
