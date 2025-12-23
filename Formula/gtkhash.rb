class Gtkhash < Formula
  version "1.5"
  desc "A cross-platform desktop utility for computing message digests or checksums"
  homepage "https://gtkhash.org"
  url "https://github.com/gtkhash/gtkhash/releases/download/v#{version}/gtkhash-#{version}.tar.gz"
  sha256 "413247bf598be9ab6f35154861cbc27def26c89936a67036fb57e59185a88077"
  license "GPL-2.0"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "libb2"
  depends_on "libgcrypt"
  depends_on "librsvg"
  depends_on "mbedtls"
  depends_on "nettle"
  depends_on "zlib"

  def install
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", "-Dmbedtls=true", "-Dnettle=true", *std_meson_args
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
