class Xinvest < Formula
  version "2.5.1"
  desc "A program which provides personal finance tracking and performance capabilities"
  homepage "https://x11cp.org/apps/xinvest"
  url "https://marceljj.org/pkg/bin/xinvest-#{version}.tar.gz"
  sha256 "2013d46d05739f48a0798a24b0e038e68940829deebdb720f26af7993d9381ef"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "openmotif"

  def install
    bin.install "Xinvest"
    (lib/"X11/app-defaults").install "Xinvest.ad" => "Xinvest"
  end

  test do
    system "false"
  end
end
