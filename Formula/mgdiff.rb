class Mgdiff < Formula
  version "1.0"
  desc "A graphical frontend to the diff command, written using Motif"
  homepage "https://x11cp.org/apps/mgdiff"
  url "https://marceljj.org/pkg/mgdiff-#{version}.tar.gz"
  sha256 "8b0789ec1715c98d7b2eaaa95666373aac2f6ca3ca498e1a9fe64e38098f32b8"

  depends_on "imake" => :build
  depends_on "openmotif"

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
