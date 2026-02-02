class Wind < Formula
  version "1.5"
  desc "A window manager for the X Window System"
  homepage "https://windwm.sourceforge.net"
  url "https://downloads.sourceforge.net/project/windwm/wind-#{version}.tar.gz"
  sha256 "76601df136ddc93f5841711f5406372fe157a7f386ee92b54808eaa34bb05c5c"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "libx11"
  depends_on "libxft"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
