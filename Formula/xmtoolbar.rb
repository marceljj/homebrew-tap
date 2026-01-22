class Xmtoolbar < Formula
  version "1.2"
  desc "An ancient Motif-based toolbar for X11"
  homepage "https://x11cp.org/apps/xmtoolbar"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "libx11"
  depends_on "openmotif"

  def install
    Dir.chdir("src/xmtoolbar") do
      inreplace "toolbar.h", "DEFAULT_PIX     \"default.xpm\"", "DEFAULT_PIX     \"#{share}/xmtoolbar/default.xpm\""
    
      system "make", "-f", "makefile.simple"
      bin.install "xmtoolbar"
      doc.install "README"
      (share/"xmtoolbar").install "default.xpm"
      (share/"xmtoolbar").install "space.xpm"
      (etc/"X11/app-defaults").install "Xmtoolbar.ad" => "Xmtoolbar"
    end
  end

  test do
    system "false"
  end
end
