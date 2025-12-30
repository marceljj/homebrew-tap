class Hexchat < Formula
  version "2.16.2"
  desc "An IRC client based on XChat"
  homepage "https://hexchat.github.io"
  url "https://github.com/hexchat/hexchat/releases/download/v#{version}/hexchat-#{version}.tar.xz"
  sha256 "2e88340a8da274b87373ec0740746da78120cc6fbfdd201a4dd6999cac790e4a"
  license "GPL-2.0"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "cffi"
  depends_on "glib"
  depends_on "gtk+"
  depends_on "iso-codes"
  depends_on "luajit"
  depends_on "perl"
  depends_on "python"
  depends_on "tcl-tk"

  def install
    ENV["DESTDIR"] = "/"

    args = %w[
      -Dtext-frontend=true
      -Dwith-perl-legacy-api=true
    ]

    system "meson", "setup", "build", *args, *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+"].opt_bin/"gtk2-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
