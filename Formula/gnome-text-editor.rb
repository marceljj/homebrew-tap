class GnomeRobots < Formula
  desc "A simple text editor focused on a pleasing default experience"
  homepage "https://apps.gnome.org/TextEditor"
  url "https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/49.0/gnome-text-editor-49.0.tar.gz"
  sha256 "fadb4a1ab60de56ef1aa1eaf88fc27a0d9e3520c28026f587a36f5b4d69e8b2c"
  license "GPL-3.0"
  version "49.0"

  depends_on "desktop-file-utils"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "itstool"
  depends_on "meson"

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
