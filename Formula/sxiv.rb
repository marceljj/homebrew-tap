class Sxiv < Formula
  version "1.0"
  desc "A program which displays a timetable, one day at a time, between Monday and Friday."
  homepage "https://x11cp.org/apps/xtt"
  url "https://marceljj.org/pkg/xtt-#{version}.tar.gz"
  sha256 "2b28b66c351e96124f0b03e44fd1ae0e6dcc78b977d731d89adab821a8918de7"

  depends_on "giflib"
  depends_on "imlib2"
  depends_on "libexif"
  depends_on "libx11"
  depends_on "libxft"
  depends_on "fontconfig"
  depends_on "freetype2"

  def install
    system "make"
    system "make", "install"
  end
  
  test do
    system "sxiv", "-h"
  end
end
