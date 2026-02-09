class Xnedit < Formula
  version "1.6.3"
  desc "A fast and classic X11 text editor, based on NEdit, with full unicode support and antialiased text rendering"
  homepage "https://www.unixwork.de/xnedit"
  url "https://github.com/unixwork/xnedit/releases/download/v#{version}/xnedit-#{version}.tar.gz"
  sha256 "8ba69f792412fd86a037b77ab36e706773d541b96aea0ecfd0ee080968076355"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "freetype"
  depends_on "fontconfig"
  depends_on "libiconv"
  depends_on "libx11"
  depends_on "libxft"
  depends_on "openmotif"

  def install
    inreplace "Makefile", "$(DESTDIR)$(PREFIX)/share/icons/xnedit.png", "$(DESTDIR)$(PREFIX)/share/icons/hicolor/96x96/xnedit.png"
    on_macos do
      system "make", "macos", "PREFIX=#{prefix}"
    end
    on_linux do
      system "make", "linux", "PREFIX=#{prefix}"
    end
    
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
