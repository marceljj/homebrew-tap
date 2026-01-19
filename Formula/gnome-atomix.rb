class Gnome2048 < Formula
  version "48.alpha"
  desc "A mind game - build molecules out of single atoms"
  homepage "https://gitlab.gnome.org/GNOME/gnome-2048"
  url "https://gitlab.gnome.org/GNOME/atomix.git", branch: "main"
  license "GPL-2.0-or-later"

  depends_on "desktop-file-utils" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "libadwaita"
  depends_on "libgnome-games-support"

  def install
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk3"].opt_bin/"gtk3-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
