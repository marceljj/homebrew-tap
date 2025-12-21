class Xinvest < Formula
  version "2.5.1"
  desc "A program which provides personal finance tracking and performance capabilities"
  homepage "https://x11cp.org/apps/xinvest"
  url "https://codeberg.org/x11cp/x11cp.git", branch "main"

  depends_on "imake" => :build
  depends_on "openmotif"

  def install
    system "cd", "x11cp/src/xinvest"
    inreplace "drawing.c", "static firsttime", "int static firsttime"
    inreplace "Imakefile", "-fcommon", "-fcommon -w"
    inreplace "portfolio.c", "<values.h>", "<float.h>"
    inreplace "status.c", "static lineno", "int static lineno"
    inreplace "xinvest.c", "<unistd.h>", "<unistd.h>\n#include <stdlib.h>"

    system "touch", "Xinvest.man"
    system "xmkmf"
    system "make"
    bin.install "Xinvest"
    (lib/"X11/app-defaults").install "Xinvest.ad" => "Xinvest"
    doc.install "CHANGES"
    doc.install "README"
    doc.install "TODO"
  end

  test do
    system "false"
  end
end
