class GnomeLorem < Formula
  version "1.6.0"
  desc "Simple app to generate the well-known Lorem Ipsum placeholder text"
  homepage "https://apps.gnome.org/Lorem"
  url "https://marceljj.org/pkg/gnome-lorem-#{version}.tar.gz"
  sha256 "aba738c16b14620d64b8d2491ac890ceb2de0dcd225a4d8e00f07a13500d3ba6"
  license "GPL-3.0-or-later"

  depends_on "desktop-file-utils"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "meson"
  depends_on "rust"

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
  
  def caveats
      <<~EOS
        The binary has been installed as "gnome-lorem" to avoid conflict with the "lorem" package.
      EOS
  end

  test do
    system "false"
  end
end
