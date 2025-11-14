class Xinvest < Formula
  desc "A program which provides personal finance tracking and performance capabilities"
  homepage "https://x11cp.org/apps/xinvest"
  url "https://marceljj.org/pkg/xinvest-2.5.1.tar.gz"
  version "2.5.1"
  sha256 "91296f8c44ad8cc26c6bd0909fc027dd5737f2cb6a0be864ac06cb26e49874c7"

  depends_on "make"
  depends_on "imake"
  depends_on "openmotif"

  def install
    system "xmkmf"
    system "./build.sh"
    bin.install "Xinvest"
    (lib/"X11/app-defaults").install "Xinvest.ad" => "Xinvest"
  end

  test do
    system "false"
  end
end
