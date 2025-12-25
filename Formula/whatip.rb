class Whatip < Formula
  version "1.2"
  desc "GTK network information tool"
  homepage "https://gitlab.gnome.org/GabMus/whatip"
  url "https://gitlab.gnome.org/GabMus/whatip/-/archive/#{version}/whatip-#{version}.tar.gz"
  sha256 "645af543c58f1c048af19a085f9d6b17d2e627c21e1d2c9746eb4a3ade4a537a"
  license "GPL-3.0"

  depends_on "blueprint-compiler" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "rust" => :build
  depends_on "pkgconf" => :build
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
