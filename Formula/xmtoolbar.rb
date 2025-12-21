class Xmtoolbar < Formula
  version "1.2"
  desc "An ancient Motif-based toolbar for X11"
  homepage "https://x11cp.org/apps/xmtoolbar"
  url "https://marceljj.org/pkg/xmtoolbar-#{version}.tar.gz"
  sha256 "806af278d0d102f312c6caec49648b6dc4173e01093fb40cd4032f2abf280e5a"
  
  depends_on "openmotif"

  def install
    inreplace "toolbar.h", "DEFAULT_PIX     \"default.xpm\"", "DEFAULT_PIX     \"#{share}/xmtoolbar/default.xpm\""
    
    system "make", "-f", "makefile.simple"
    bin.install "xmtoolbar"
    (share/"xmtoolbar").install "default.xpm"
    (etc/"X11/app-defaults").install "Xmtoolbar.ad" => "Xmtoolbar"
  end

  test do
    system "false"
  end
end
