class GftpGtk < Formula
  version "2.9.1b-2025.12"
  desc "A free multithreaded file transfer client for *NIX based machines"
  homepage "http://www.gftp.org"
  url "https://github.com/masneyb/gftp.git", branch: "master"
  license "MIT"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"

  def install
    ENV["DESTDIR"] = "/"
    
    args = %w[
      -Dgtk2=false
      -Dgtk3=true
    ]

    inreplace "docs/gftp.desktop", "Exec=gftp", "Exec=gftp-gtk"
    inreplace "docs/meson.build", "install_man('gftp.1')", "install_man('gftp-gtk.1')"
    inreplace "src/meson.build", "output: 'gftp',", "output: 'gftp-gtk',"
    system "mv", "docs/gftp.1", "doc/gftp-gtk.1"
    
    system "meson", "setup", "build", *args, *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+3"].opt_bin/"gtk3-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  def caveats
      <<~EOS
        The binary has been installed as "gftp-gtk" to avoid conflict with the "inetutils" package.
      EOS
  end

  test do
    system "false"
  end
end
