class Mgdiff < Formula
  desc "A graphical frontend to the diff command, written using Motif"
  homepage "https://x11cp.org/apps/mgdiff"
  url "https://marceljj.org/pkg/mgdiff-1.0.tar.gz"
  version "1.0"
  sha256 "ab3db2cf618e3d914dbd3dad3ecc7cfe370fdd1970a9e13c938a4c37be794c86"

  depends_on "make"
  depends_on "imake"
  depends_on "openmotif"

  def install
    system "xmkmf"
    system "make"
    system "make install"
  end

  test do
    system "false"
  end
end
