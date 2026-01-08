class Vgp < Formula
  version "1.1"
  desc "An application which allows for visualising vectors which change over time"
  homepage "https://x11cp.org/apps/vgp"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "libx11"
  
  def install
    Dir.chdir("src/vgp") do
      inreplace "getopt.c" do |s|
        s.gsub! "<stdio.h>", "<stdio.h>\n#include <string.h"
      end
      
      system "./configure", *std_configure_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
