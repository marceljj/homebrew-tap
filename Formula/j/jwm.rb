class Jwm < Formula
  version "2.4.6"
  desc "A light-weight window manager for the X11 Window System"
  homepage "https://joewing.net/projects/jwm"
  url "https://github.com/joewing/jwm/releases/download/v#{version}/jwm-#{version}.tar.xz"
  sha256 "b5871ec28317594b3fa22b83ed5524cc911d498c455eaab3ae68def195dd802d"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "cairo"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "librsvg"
  depends_on "libx11"
  depends_on "libxext"
  depends_on "libxft"
  depends_on "libxinerama"
  depends_on "libxmu"
  depends_on "libxpm"
  depends_on "libxrender"
  depends_on "pango"

  def install
    system "./configure", *std_configure_args
    inreplace "Makefile", "install -m 644 example.jwmrc $(SYSCONF)/system.jwmrc", ""
    system "make"
    system "make", "install"
    doc.install "example.jwmrc"
  end

  test do
    system "false"
  end
end
