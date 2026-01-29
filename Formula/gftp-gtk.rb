class GftpGtk < Formula
  version "2.9.1b"
  desc "A free multithreaded file transfer client for *NIX based machines"
  homepage "http://www.gftp.org"
  url "https://github.com/masneyb/gftp/archive/refs/tags/#{version}.tar.gz"
  sha256 "fb134d5479a6b81251b9d37be7264fb8be6edb07bce98569e0e0ba9570587fd6"
  license "MIT"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"
  
  uses_from_macos "ncurses"

  def install
    ENV["DESTDIR"] = "/"
    
    args = %w[
      -Dgtk2=false
      -Dgtk3=true
    ]
    
    inreplace "src/meson.build", "output: 'gftp',", "output: 'gftp-gtk',"
    
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+3"].opt_bin/"gtk3-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
