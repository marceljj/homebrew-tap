class GnomeKeypunch < Formula
  version "6.3"
  desc "Practice your typing skills"
  homepage "https://apps.gnome.org/Keypunch"
  url "https://github.com/bragefuglseth/keypunch/archive/refs/tags/v#{version}.tar.gz"
  sha256 "eb08356872ecf8fe58b0637cc9098f4ab2060126ef2c2ba4dcf2ef3bef3d768f"
  license "GPL-3.0"

  depends_on "gnu-sed" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "rust" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"

  def install
    ENV["DESTDIR"] = "/"

    inreplace "data/meson.build", "find_program('sed'", "find_program('gsed'"
    
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
