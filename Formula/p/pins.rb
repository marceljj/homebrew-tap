class Pins < Formula
  version "2.4.5"
  desc "Create and edit app shortcuts"
  homepage "https://github.com/fabrialberio/Pins"
  url "https://github.com/fabrialberio/Pins/archive/refs/tags/v#{version}.tar.gz"
  sha256 "f8fa2ec262e45c9ab9da0a57489c5be71dd31073ac22d9505f78c941aa343f83"
  license "GPL-3.0"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "gettext"
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
