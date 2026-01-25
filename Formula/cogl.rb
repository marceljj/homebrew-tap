class Cogl < Formula
  version "1.22.8"
  desc "A small open source library for using 3D graphics hardware for rendering"
  homepage "https://gitlab.gnome.org/Archive/cogl"
  url "https://gitlab.gnome.org/Archive/cogl/-/archive/#{version}/cogl-#{version}.tar.gz"
  sha256 "bc8a3b2f75cee9d7fb38a6f285d47c1950ba27981e5f2b4b2fa248992f428a04"
  license all_of: ["BSD-3-Clause", "MIT", "SGI-B-2.0"]

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on "cairo"
  depends_on "gdk-pixbuf"
  depends_on "glib"
  depends_on "gobject-introspection"
  depends_on "gstreamer"
  depends_on "gtk-doc"
  depends_on "libx11"
  depends_on "libxcomposite"
  depends_on "libxdamage"
  depends_on "libxext"
  depends_on "libxfixes"
  depends_on "libxrandr"
  depends_on "mesa"
  depends_on "pango"

  def install
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
