class L3afpad < Formula
  version "0.8.18.1.11"
  desc "Simple text editor forked from Leafpad"
  homepage "https://github.com/tarot231/leafpad"
  url "https://github.com/stevenhoneyman/l3afpad/archive/refs/tags/v#{version}.tar.gz"
  license "GPL-2.0"
  
  depends_on "automake" => :build
  depends_on "intltool" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"
  
  uses_from_macos "ncurses"

  def install
    system "./autogen.sh"
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
