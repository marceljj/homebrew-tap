class GnomeTour < Formula
  desc "A guided tour and greeter for GNOME"
  homepage "https://apps.gnome.org/Tour"
  url "https://gitlab.gnome.org/GNOME/gnome-tour/-/archive/49.0/gnome-tour-49.0.tar.gz"
  sha256 "71f129e97c77a2e4197f588ac8bcf9b9ae191aab2547ce8925353f093bda75b6"
  license "GPL-3.0"
  version "49.0"

  depends_on "desktop-file-utils"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "meson"
  depends_on "rust"

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
