class Celluloid < Formula
  version "0.29"
  desc "A simple GTK+ frontend for mpv"
  homepage "https://celluloid-player.github.io/"
  url "https://github.com/celluloid-player/celluloid/releases/download/v#{version}/celluloid-#{version}.tar.xz"
  sha256 "5b9991557cc2764a8281a24aa726a645287eb075cde0f0ae7c737965264a119c"
  license "GPL-3.0"

  depends_on "desktop-file-utils" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "lua"

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
