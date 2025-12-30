class HexchatOtr < Formula
  version "0.2.2"
  desc "Off the record plugin for HexChat"
  homepage "https://github.com/TingPing/hexchat-otr"
  url "https://github.com/TingPing/hexchat-otr.git", branch: "master"
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
    lib.install "build/src/otr.dylib"
  end

  def caveats
    <<~EOS
      The HexChat OTR plugin has been installed to:
        #{lib}/otr.dylib

      To enable it in HexChat, symlink it to the addons directory:
        ln -s #{lib}/otr.dylib ~/.config/hexchat/addons/otr.dylib
    EOS
  end

  test do
    system "false"
  end
end
