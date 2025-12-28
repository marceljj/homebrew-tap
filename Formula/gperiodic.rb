class Gperiodic < Formula
  version "git-2025.03"
  desc "A program for looking up data of elements from the periodic table"
  homepage "https://github.com/zploskey/gperiodic"
  url "https://github.com/zploskey/gperiodic.git", branch: "master"
  license "GPL-2.0"

  depends_on "coreutils" => :build
  depends_on "intltool" => :build
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

    inreplace "Makefile", "install", "ginstall"
    
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
