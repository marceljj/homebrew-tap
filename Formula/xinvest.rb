class Xinvest < Formula
  desc "A program which provides personal finance tracking and performance capabilities"
  homepage "https://x11cp.org/apps/xinvest"
  url "https://marceljj.org/pkg/xinvest-2.5.1.tar.gz"
  version "2.5.1"
  sha256 "64b74481e319906cd109e294fda3def256a2af8c8f1b9f711c571d591e9ec864"

  depends_on "make"
  depends_on "imake"
  depends_on "openmotif"

  def install
    system "xmkmf"
    system "make -s 2>/dev/null"
    bin.install "Xinvest"
    (lib/"X11/app-defaults").install "Xinvest.ad" => "Xinvest"
  end

  test do
    system "false"
  end
end
