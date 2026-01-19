class GnomeDSpy < Formula
  version "50.alpha"
  desc "Inspect peers on a D-Bus connection"
  homepage "https://gitlab.gnome.org/GNOME/gnome-2048"
  url "https://gitlab.gnome.org/GNOME/d-spy/-/archive/#{version}/d-spy-#{version}.tar.gz"
  sha256 "2d51558eb4f055ba10af1da063d4c3e2ebdac2cc4ff135de117319093319957d"
  license "GPL-3.0"

  depends_on "desktop-file-utils" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "libdex"
  
  on_macos do
    depends_on "gettext"
  end

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
