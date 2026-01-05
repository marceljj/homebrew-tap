class Xtt < Formula
  version "1.0"
  desc "A program which displays a timetable, one day at a time, between Monday and Friday."
  homepage "https://x11cp.org/apps/xtt"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "imake" => :build

  def install
    Dir.chdir("src/xtt") do
      inreplace "xtt.c" do |s|
        s.gsub! "<stdio.h>", "<stdio.h>\n#include <stdlib.h>"
        s.gsub! "extern getenv()", "char *getenv(const char *name)"
      end
    end
    
    system "xmkmf"
    system "make"
    bin.install "xtt"
    man1.install "xtt.man" => "xtt.1"
    doc.install "example.xtt"
    doc.install "README"
  end

  def caveats
    <<~EOS
      The timetable file should be placed in your home directory as such:
        ~/.xtt
      
      An example file is located in:
        #{doc}/xtt/example.xtt
    EOS
  end
  
  test do
    system "false"
  end
end
