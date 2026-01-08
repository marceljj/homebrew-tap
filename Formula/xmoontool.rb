class Xmoontool < Formula
  version "3.0.1"
  desc "An application displaying real time information about the moon"
  homepage "https://x11cp.org/apps/xmoontool"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "libx11"
  depends_on "libxt"
  depends_on "libxpm"
  
  def install
    Dir.chdir("src/xmoontool") do
      inreplace "xmoontool.c" do |s|
        s.gsub! "<stdio.h>", "<stdio.h>\n#include <stdlib.h>\n#include <unistd.h>"
      end
      
      system "make"
      bin.install "xmoontool"
      man1.install "xmoontool.1"
    end
  end

  test do
    system "false"
  end
end
