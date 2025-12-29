class Xcowsay < Formula
  version "1.6"
  desc "Graphical talking cow"
  homepage "http://www.doof.me.uk/xcowsay"
  url "https://github.com/nickg/xcowsay/releases/download/v#{version}/xcowsay-#{version}.tar.gz"
  sha256 "46ace864ff28d2d21f4b7058f0295e18d0041a120c1078a951fa43c4e0f5c8c5"
  license "GPL-3.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "fontconfig" => :build
  depends_on "gettext" => :build
  depends_on "pkgconf" => :build
  depends_on "dbus"
  depends_on "dbus-glib"
  depends_on "fortune"
  depends_on "glib"
  depends_on "gtk+3"

  def install
    inreplace "src/xcowfortune", "/usr/games", "#{prefix}/../../../bin"
    on_macos do
      inreplace "src/display_cow.c", "setenv(\"GDK_BACKEND\", \"x11\", 1);", ""
    end

    args = %w[
      --enable-dbus
    ]
    
    system "./configure", *args, *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
