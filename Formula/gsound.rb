class Gsound < Formula
  version "1.0.3"
  desc "A small library for playing system sounds"
  homepage "https://gitlab.gnome.org/GNOME/gsound"
  url "https://gitlab.gnome.org/GNOME/gsound/-/archive/#{version}/gsound-#{version}.tar.gz"
  sha256 "ebee33c77f43bcae87406c20e051acaff08e86f8960c35b92911e243fddc7a0b"
  license "LGPL-2.1"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "vala" => :build
  depends_on "glib"
  depends_on "gobject-introspection"
  depends_on "libcanberra"

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
