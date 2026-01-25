class Xstarroll < Formula
  version "1.1b"
  desc "A scrolling science fiction program for X11"
  homepage "https://kozos.jp/myfreesoft/#5"
  url "https://kozos.jp/myfreesoft/xstarroll-#{version}.tar.gz"
  sha256 "c2a83cb6dc70bc578ab821142032d4e2e284701d241936bfd4c7c35f61c9205a"
  license :cannot_represent

  depends_on "libx11"
  depends_on "libxaw"
  depends_on "libxmu"
  depends_on "libxpm"
  depends_on "libxt"
  
  def install
    inreplace "Makefile" do |s|
      s.gsub! "XSTARROLL_PREFIX = /usr/X11R6", "XSTARROLL_PREFIX = #{prefix}"
      s.gsub! "${XSTARROLL_PREFIX}/man/man1", "${XSTARROLL_PREFIX}/share/man/man1"
      s.gsub! "-I/usr/X11R6/include", "-I#{Formula["libx11"].opt_include} -I#{Formula["libx11"].opt_include} -I#{Formula["libxaw"].opt_include} -I#{Formula["libxmu"].opt_include} -I#{Formula["libxpm"].opt_include} -I#{Formula["libxt"].opt_include}"
      s.gsub! "-L/usr/X11R6/lib", "-L#{Formula["libx11"].opt_lib} -L#{Formula["libx11"].opt_lib} -L#{Formula["libxaw"].opt_lib} -L#{Formula["libxmu"].opt_lib} -L#{Formula["libxpm"].opt_lib} -L#{Formula["libxt"].opt_lib}"
    end
    inreplace "xstarroll.c" do |s|
      s.gsub! "#include<stdlib.h>", "#include<stdlib.h>\n#include<unistd.h>"
      s.gsub! "static y", "int static y"
    end
    
    system "make"
    bin.install "xstarroll"
    man1.install "xstaroll.man" => "xstarroll.1"
  end

  test do
    system "xstarroll", "-h"
  end
end
