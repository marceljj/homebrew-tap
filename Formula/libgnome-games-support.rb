class LibgnomeGamesSupport < Formula
  version "2.0.2"
  desc "A small library intended for internal use by GNOME Games, but it may be used by others"
  homepage "https://gitlab.gnome.org/GNOME/libgnome-games-support"
  url "https://gitlab.gnome.org/GNOME/libgnome-games-support/-/archive/#{version}/libgnome-games-support-#{version}.tar.gz"
  sha256 "bf36baf14e6aa0388e4c4addf8c35a154f1c2252986dbae06e5c6f6187b531c4"
  license any_of: ["GPL-3.0", "LGPL-3.0"]

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "vala" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "libgee"

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
