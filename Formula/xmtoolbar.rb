class Xmtoolbar < Formula
  version "1.2"
  desc "An ancient Motif-based toolbar for X11"
  homepage "https://x11cp.org/apps/xmtoolbar"
  url "https://marceljj.org/pkg/xmtoolbar-#{version}.tar.gz"
  sha256 "2607ed97ffe640d775d098bad1d1bfe2673c09d8b4749ae7229aae3cbbdd25a9"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "openmotif"

  def install
    inreplace "toolbar.h", "DEFAULT_PIX     \"default.xpm\"", "DEFAULT_PIX     \"#{share}/xmtoolbar/default.xpm\""
    
    system "make"
    bin.install "xmtoolbar"
    (share/"xmtoolbar").install "default.xpm"
    (etc/"X11/app-defaults").install "Xmtoolbar.ad" => "Xmtoolbar"
  end

  test do
    system "false"
  end
end
