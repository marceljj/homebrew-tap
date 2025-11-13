class Xinvest < Formula
  desc "A program which provides personal finance tracking and performance capabilities"
  homepage "https://x11cp.org/apps/xinvest"
  url "https://marceljj.org/pkg/xinvest-2.5.1.tgz"
  sha256 "1bd61c42cb4c18889c3efaf600946cf273ea6edfb2d3b8fe923ebb50740896d4"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "Xinvest"
    (lib/"X11/app-defaults").install "Xinvest.ad" => "Xinvest"
  end

  test do
    system "false"
  end
end
