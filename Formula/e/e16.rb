class E16 < Formula
  version "1.0.31"
  desc "Enlightenment 16 window manager for X11"
  homepage "https://www.enlightenment.org/e16"
  url "https://sourceforge.net/projects/enlightenment/files/e16/#{version}/e16-#{version}.tar.gz"
  sha256 "4b2255d43eab66dddd4599096d82948927d28997c0ce445dcc65528f682efe91"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "dbus"
  depends_on "freetype"
  depends_on "gettext"
  depends_on "imlib2"
  depends_on "libsndfile"
  depends_on "libsm"
  depends_on "libx11"
  depends_on "libxcomposite"
  depends_on "libxdamage"
  depends_on "libxft"
  depends_on "libxinerama"
  depends_on "libxrandr"
  depends_on "libxxf86vm"
  depends_on "pulseaudio"

  def install
    on_macos do
      system "./configure", "--enable-sound-pulse", "--with-sound-player=\"/usr/bin/afplay %s\"", *std_configure_args
    end
    on_linux do
      system "./configure", "--enable-sound-pulse", *std_configure_args
    end
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
