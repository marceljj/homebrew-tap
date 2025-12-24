class GnomeTextEditor < Formula
  version "49.0"
  desc "A simple text editor focused on a pleasing default experience"
  homepage "https://apps.gnome.org/TextEditor"
  url "https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/#{version}/gnome-text-editor-#{version}.tar.gz"
  sha256 "fadb4a1ab60de56ef1aa1eaf88fc27a0d9e3520c28026f587a36f5b4d69e8b2c"
  license "GPL-3.0"

  depends_on "desktop-file-utils" => :build
  depends_on "itstool" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "rust" => :build
  depends_on "pkgconf" => :build
  depends_on "editorconfig"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "gtksourceview5"
  depends_on "libadwaita"
  depends_on "libspelling"

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
