class Pekwm < Formula
  version "0.4.1"
  desc "X window manager back from the past"
  homepage "https://www.pekwm.se"
  url "https://github.com/pekwm/pekwm/releases/download/release-#{version}/pekwm-#{version}.tar.gz"
  sha256 "25d1860b88df9c1f14a40f212ca28f7fd568a7c645cb55109b75cb915571b1d6"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "cairo"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "libx11"
  depends_on "libxext"
  depends_on "libxft"
  depends_on "libxinerama"
  depends_on "libxpm"
  depends_on "libxrandr"
  depends_on "pango"

  uses_from_macos "curl"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
