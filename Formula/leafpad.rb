class Leafpad < Formula
  version "git-2025.03"
  desc "GTK+ based simple text editor"
  homepage "https://github.com/tarot231/leafpad"
  url "https://github.com/tarot231/leafpad.git", branch: "main"
  license "GPL-2.0"
  
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "gettext" => :build
  depends_on "intltool" => :build
  depends_on "glib"
  depends_on "gtk+"

  def install
    system "autoreconf", "-fi"
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
