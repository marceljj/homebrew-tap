class Mtpaint < Formula
  version "3.50"
  desc "Mark Tyler's Painting Program"
  homepage "https://mtpaint.sourceforge.net"
  url "https://downloads.sourceforge.net/project/mtpaint/mtpaint/#{version}/mtpaint-#{version}.tar.bz2"
  sha256 "695cea10c428a8f122ed59beee5ffa49dcdcba8d88a4790eaf3c64fd7c73d6ac"
  license "GPL-3.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"
  
  uses_from_macos "ncurses"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+3"].opt_bin/"gtk3-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
