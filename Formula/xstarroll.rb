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
      s.gsub! "-I/usr/X11R6/include", "-I#{Formula["libx11"].opt_include} -I#{Formula["libxaw"].opt_include} -I#{Formula["libxmu"].opt_include} -I#{Formula["libxpm"].opt_include} -I#{Formula["libxt"].opt_include}"
      s.gsub! "-L/usr/X11R6/lib", "-L#{Formula["libx11"].opt_lib} -L#{Formula["libxaw"].opt_lib} -L#{Formula["libxmu"].opt_lib} -L#{Formula["libxpm"].opt_lib} -L#{Formula["libxt"].opt_lib}"
    end
    inreplace "xstarroll.c" do |s|
      s.gsub! "#include<stdlib.h>", "#include<stdlib.h>\n#include<unistd.h>"
      s.gsub! "static y", "int static y"
    end
    inreplace "xstarroll.man", "XSTARROLL 1", "XSTARROLL 6"
    
    system "make"
    bin.install "xstarroll"
    man6.install "xstarroll.man" => "xstarroll.6"
    doc.install "COPYRIGHT.euc" => "COPYRIGHT"
    doc.install "README.euc" => "README"

    inreplace "sample11.sh", "./xstarroll", "xstarroll"
    inreplace "sample12.sh", "./xstarroll", "xstarroll"
    inreplace "sample13.sh", "./xstarroll", "xstarroll"
    inreplace "sample14.sh", "./xstarroll", "xstarroll"
    inreplace "sample21.sh", "./xstarroll", "xstarroll"
    inreplace "sample22.sh", "./xstarroll", "xstarroll"
    inreplace "sample23.sh", "./xstarroll", "xstarroll"
    (doc/"examples").install "sample1.txt"
    (doc/"examples").install "sample1.xpm"
    (doc/"examples").install "sample11.sh"
    (doc/"examples").install "sample12.sh"
    (doc/"examples").install "sample13.sh"
    (doc/"examples").install "sample14.sh"
    (doc/"examples").install "sample2.txt"
    (doc/"examples").install "sample2.xpm"
    (doc/"examples").install "sample21.sh"
    (doc/"examples").install "sample22.sh"
    (doc/"examples").install "sample23.sh"
    (doc/"examples").install "sample3.txt"
    (doc/"examples").install "sample4.txt"
  end

  test do
    system "xstarroll", "-h"
  end
end
