class Typesetter < Formula
  version "0.8.3"
  desc "A minimalist, local-first Typst editor"
  homepage "https://typesetter.trowell.net"
  url "https://codeberg.org/haydn/typesetter/archive/v#{version}.tar.gz"
  sha256 "8adcbf90ba74f11901d480fa9e9af57dffa96ee59ac2adc6dd6369ae37e32ccc"
  license "GPL-3.0"

  depends_on "desktop-file-utils" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "rust" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "python"

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
