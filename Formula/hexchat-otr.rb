class HexchatOtr < Formula
  version "0.2.2"
  desc "Off the record plugin for HexChat"
  homepage "https://github.com/TingPing/hexchat-otr"
  url "https://github.com/TingPing/hexchat-otr/releases/download/#{version}/hexchat-otr-#{version}.tar.xz"
  sha256 "e18425f4b20447caddf64a9079b8750200100e158a03575d89457bb6d8f8d5f1"
  license "GPL-2.0"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "appstream-glib"
  depends_on "glib"
  depends_on "hexchat"
  depends_on "libgcrypt"
  depends_on "libotr"

  def install
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "false"
  end
end
