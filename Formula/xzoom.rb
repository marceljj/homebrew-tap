class Xzoom < Formula
  version "1.2"
  desc "A magnifier for X11, allowing for portions of windows or the desktop to be magnified"
  homepage "https://x11cp.org/apps/xzoom"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license "xzoom"

  depends_on "imake" => :build
  depends_on "libx11"
  depends_on "libxext"
  depends_on "libxt"

  def install
    Dir.chdir("src/xzoom") do
      inreplace "xzoom.c", "<stdlib.h>", "<stdlib.h>\n#include <unistd.h"

      system "xmkmf"
      system "make"
      bin.install "xzoom"
      man1.install "xzoom.man" => "xzoom.1x"
      
      doc.install "copyright"
      doc.install "changelog"
      doc.install "README.orig"
    end
  end

  test do
    system "false"
  end
end
