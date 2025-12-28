class Gperiodic < Formula
  version "1.3.3"
  desc "A periodic table application written in GTK"
  homepage "http://gperiodic.seul.org"
  url "http://gperiodic.seul.org/downloads/gperiodic-#{version}.tar.gz"
  sha256 "5858eb726867e8c28f42101dbff7a5234b960f5944c7800939bf39a775147322"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  
  def install
    args = %w[
      bindir=#{bin}
      datadir=#{share}
      mandir=#{share}/man/man1
      iconsdir=#{share}/icons
    ]
    system "make", *args
    system "make", *args, "install"
    doc.install "AUTHORS"
    doc.install "ChangeLog"
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
