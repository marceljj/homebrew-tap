class Mgdiff < Formula
  desc "A graphical frontend to the diff command, written using motif"
  homepage "https://x11cp.org/apps/mgdiff"
  url "https://marceljj.org/pkg/mgdiff-1.0.tgz"
  sha256 "3fe48cfcf4d016c5409d2fb6c0664ceb05d6c62227d6af9b6884c8e801ac1ea9"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "openmotif"

  def install
    bin.install "mgdiff"
    man1.install "mgdiff.man" => "mgdiff.1"
    (etc/"X11/app-defaults").install "Mgdiff.ad" => "Mgdiff"
  end

  test do
    system "false"
  end
end
