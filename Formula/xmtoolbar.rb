class Xmtoolbar < Formula
  desc "A graphical frontend to the diff command, written using Motif"
  homepage "https://x11cp.org/apps/xmtoolbar"
  url "https://marceljj.org/pkg/xmtoolbar-1.2.tar.gz"
  version "1.0"
  sha256 "57ed1d1e0e43eff34fb57aabec60e12103e85a2735d856fbe723c0a41b9516a8"

  depends_on "make"
  depends_on "openmotif"

  def install
    system "make"
    bin.install "xmtoolbar"
    (etc/"X11/app-defaults").install "Xmtoolbar.ad" => "Xmtoolbar"
  end

  test do
    system "false"
  end
end
