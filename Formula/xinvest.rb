class Xinvest < Formula
  version "2.5.1"
  desc "A program which provides personal finance tracking and performance capabilities"
  homepage "https://x11cp.org/apps/xinvest"
  url "https://marceljj.org/pkg/xinvest-#{version}.tar.gz"
  sha256 "5721b20acabb8da1a645ee8eb7f6336c5cdcfff493a4627e98789f8a73398a02"

  depends_on "imake" => :build

  def install
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
  end

  test do
    system "false"
  end
end
