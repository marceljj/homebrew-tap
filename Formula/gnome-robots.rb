class GnomeRobots < Formula
  desc "A game where you try and avoid a band of marauding robots which are trying to kill you."
  homepage "https://gitlab.gnome.org/GNOME/gnome-robots"
  url "https://gitlab.gnome.org/GNOME/gnome-robots/-/archive/41.2/gnome-robots-41.2.tar.gz"
  sha256 "4bc651ab3da16fbd519f262885523b5e93bca4c5e0d3e4a289628df5a0a7762d"
  license "GPL-3.0"
  version "41.2"

  depends_on "desktop-file-utils"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "itstool"
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
