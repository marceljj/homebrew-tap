class EfaxGtk < Formula
  version "3.2.15"
  desc "GUI front end for the 'efax' fax program"
  homepage "https://efax-gtk.sourceforge.net"
  url "https://downloads.sourceforge.net/project/efax-gtk/efax-gtk/#{version}/efax-gtk-#{version}.src.tgz"
  sha256 "c43514fb2cd83390b82dba830fcbff3d6614d392c94d1da6312368d02acd211d"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "c++-gtk-utils"
  depends_on "efax"
  depends_on "glib"
  depends_on "gtk+"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+"].opt_bin/"gtk2-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
