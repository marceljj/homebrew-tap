class Vgp < Formula
  version "1.1"
  desc "An application which allows for visualising vectors which change over time"
  homepage "https://x11cp.org/apps/vgp"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license "GPL-2.0"

  depends_on "libx11"
  
  def install
    Dir.chdir("src/vgp") do
      inreplace "getopt.c" do |s|
        s.gsub! "<stdio.h>", "<stdio.h>\n#include <string.h"
      end
      
      system "./configure", *std_configure_args
      system "make"
      bin.install "vgp"
      man1.install "vgp.1"
      doc.install "COPYING"
      doc.install "NEWS"
      doc.install "README"
      doc.install "TODO"
    end
  end

  test do
    system "false"
  end
end
