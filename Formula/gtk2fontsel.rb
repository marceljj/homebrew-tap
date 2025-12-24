class Gtk2fontsel < Formula
  version "0.1"
  desc "A font selection program for X11 using the GTK2 toolkit"
  homepage "https://gtk2fontsel.sourceforge.net"
  url "https://downloads.sourceforge.net/project/gtk2fontsel/gtk2fontsel/#{version}/gtk2fontsel-#{version}.tar.gz"
  sha256 "5cd6396fc3c6e7f9bc358cc5ad30592ba446cdb0138a811216497b6453905a68"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
    doc.install "AUTHORS"
    doc.install "COPYING"
    doc.install "NEWS"
    doc.install "README"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+"].opt_bin/"gtk2-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
