class Ptyxis < Formula
  version "49.2"
  desc "A terminal for a container-oriented desktop"
  homepage "https://gitlab.gnome.org/chergert/ptyxis"
  url "https://gitlab.gnome.org/chergert/ptyxis/-/archive/#{version}/ptyxis-#{version}.tar.gz"
  sha256 "69b3b6d577538be29d8f8c69ed32e5065110e7e45e21df0511c66061f1cd0369"
  license "GPL-3.0"

  depends_on "desktop-file-utils"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "json-glib"
  depends_on "libadwaita"
  depends_on "meson"
  depends_on "vte3"

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
