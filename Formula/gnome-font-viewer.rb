class GnomeFontViewer < Formula
  desc "View fonts on your system"
  homepage "https://apps.gnome.org/FontViewer"
  url "https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/archive/49.0/gnome-font-viewer-49.0.tar.gz"
  sha256 "dd20a3bcef0cea9681dbe0b078075e23a8b46b32cda6e0342a4089b49edfb64d"
  license "GPL-2.0"
  version "49.0"

  depends_on "glib"
  depends_on "gtk4"
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
