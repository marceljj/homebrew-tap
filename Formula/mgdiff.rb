class Mgdiff < Formula
  desc "A graphical frontend to the diff command, written using motif"
  homepage "https://x11cp.org/apps/mgdiff"
  url "https://marceljj.org/pkg/mgdiff.tgz"
  sha256 "3fe48cfcf4d016c5409d2fb6c0664ceb05d6c62227d6af9b6884c8e801ac1ea9"
  license "MIT"
  revision 1

  depends_on "openmotif"

  def install
    bin.install "mgdiff"
    man1.install "mgdiff.man" => "mgdiff.1"
    (etc/"X11/app-defaults").install "Mgdiff.ad" => "Mgdiff"
  end

end
