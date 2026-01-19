class GnomeBaobab < Formula
  version "49.1"
  desc "The GNOME Disk Usage Analyzer"
  homepage "https://gitlab.gnome.org/GNOME/baobab"
  url "https://gitlab.gnome.org/GNOME/baobab/-/archive/#{version}/baobab-#{version}.tar.gz"
  sha256 "4dbc041fe0f74eea4990579f9dd6d51c737d7e9fba6c023c20e3d6e013fa1728"
  license "GPL-2.0-or-later"

  depends_on "desktop-file-utils" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "vala" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"

  def install
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", *std_meson_args
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
