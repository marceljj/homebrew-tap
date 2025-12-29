class Srain < Formula
  version "1.8.1"
  desc "Modern IRC client written in GTK"
  homepage "https://srain.silverrainz.me"
  url "https://github.com/SrainApp/srain/archive/refs/tags/#{version}.tar.gz"
  sha256 "ce7fc8e50ad2d18c5eca10f72b1e0c060bca5205720b5d51c36c3afc025fd747"
  license "GPL-3.0"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "icu4c"
  depends_on "libconfig"
  depends_on "libsecret"
  depends_on "libsoup"
  depends_on "openssl"

  def install
    ENV["DESTDIR"] = "/"

    args = %w[
        -Dapp_indicator=false
      ]

    system "meson", "setup", "build", *args, *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+3"].opt_bin/"gtk3-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
