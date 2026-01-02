class Sxiv < Formula
  version "2023.01"
  desc "https://github.com/xyb3rt/sxiv"
  homepage "https://x11cp.org/apps/xtt"
  url "https://github.com/xyb3rt/sxiv.git", branch: "master"
  license "GPL-2.0"

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
