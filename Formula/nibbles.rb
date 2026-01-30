class Nibbles < Formula
  version "4.4.2"
  desc "GNOME Nibbles game"
  homepage "https://gitlab.gnome.org/GNOME/gnome-nibbles"
  url "https://gitlab.gnome.org/GNOME/gnome-nibbles/-/archive/#{version}/gnome-nibbles-#{version}.tar.gz"
  sha256 "5c4c084c0158949c42307fe997f3c9528394f85e6aef581e81c90cba8bcc7607"
  license "GPL-3.0"

  depends_on "desktop-file-utils" => :build
  depends_on "itstool" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "vala" => :build
  depends_on "glib"
  depends_on "gsound"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "libgee"
  depends_on "libgnome-games-support"
  depends_on "pango"

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
