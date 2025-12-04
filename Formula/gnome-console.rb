class GnomeConsole < Formula
  version "49.1"
  desc "A simple user-friendly terminal emulator for the GNOME desktop"
  homepage "https://wiki.gnome.org/Apps/Terminal"
  url "https://gitlab.gnome.org/GNOME/console/-/archive/#{version}/console-#{version}.tar.gz"
  sha256 "fdfe020889b220c9521982977d000a30ce57658ba80c8fece70ba76613cdc154"
  license "GPL-3.0"

  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "libgtop"
  depends_on "meson"
  depends_on "vte3"

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
