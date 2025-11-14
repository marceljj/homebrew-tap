class Mgdiffsrc < Formula
  desc "A graphical frontend to the diff command, written using Motif"
  homepage "https://x11cp.org/apps/mgdiff"
  url "https://marceljj.org/pkg/mgdiffsrc-1.0.tgz"
  version "1.0"
  sha256 "ab3db2cf618e3d914dbd3dad3ecc7cfe370fdd1970a9e13c938a4c37be794c86"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "openmotif"
  depends_on "imake"
  depends_on "make"

  def install
    system "xmkmf"
    system "make"
    bin.install "mgdiff"
    man1.install "mgdiff.man" => "mgdiff.1"
    (etc/"X11/app-defaults").install "Mgdiff.ad" => "Mgdiff"
  end

  test do
    system "false"
  end
end
