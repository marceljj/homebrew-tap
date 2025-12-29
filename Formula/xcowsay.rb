class Xcowsay < Formula
  version "1.6"
  desc "Graphical talking cow"
  homepage "http://www.doof.me.uk/xcowsay"
  url "https://github.com/nickg/xcowsay/releases/download/v#{version}/xcowsay-#{version}.tar.gz"
  sha256 "8877d62ad9a85d5b7968fe862065f98da17209394a8df520ae583876d46f3d9b"
  license "GPL-3.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "fontconfig" => :build
  depends_on "gettext" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"

  def install
    on_macos do
      inreplace "src/display_cow.c", "setenv("GDK_BACKEND", "x11", 1);", ""
    end
    
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
