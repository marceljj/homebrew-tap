class Clutter < Formula
  version "1.26.4"
  desc "An open source software library for creating fast, compelling, portable, and dynamic graphical user interfaces"
  homepage "https://gitlab.gnome.org/Archive/clutter"
  url "https://gitlab.gnome.org/Archive/clutter/-/archive/#{version}/clutter-#{version}.tar.gz"
  sha256 "bf36baf14e6aa0388e4c4addf8c35a154f1c2252986dbae06e5c6f6187b531c4"
  license "LGPL-2.1"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "cairo"
  depends_on "cogl"
  depends_on "glib"
  depends_on "gobject-introspection"
  depends_on "json-glib"
  depends_on "libxcomposite"
  depends_on "libxdamage"
  depends_on "libxext"
  depends_on "libxkbcommon"
  depends_on "libxkbfile"
  depends_on "pango"
  depends_on "xinput"
  depends_on "xkbcomp"

  def install
    args = %w[
      -Dbackends=gdk
      -Ddocumentation=false
    ]
    
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", *args, *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "false"
  end
end
