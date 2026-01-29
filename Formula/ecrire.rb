class Ecrire < Formula
  version "0.2.0"
  desc "A text editor written using the core EFL"
  homepage "https://git.enlightenment.org/enlightenment/ecrire"
  url "https://download.enlightenment.org/rel/apps/ecrire/ecrire-#{version}.tar.xz"
  sha256 "d964598790d5b26767e21b7dbc09ca16867f530d50fa363c7694fd3c50995fdf"
  license "GPL-3.0"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "efl"
  
  on_macos do
    depends_on "gettext"
  end

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
