class Xtt < Formula
  version "1.0"
  desc "A program which displays a timetable, one day at a time, between Monday and Friday."
  homepage "https://x11cp.org/apps/xtt"
  url "https://marceljj.org/pkg/xtt-#{version}.tar.gz"
  sha256 "2b28b66c351e96124f0b03e44fd1ae0e6dcc78b977d731d89adab821a8918de7"

  depends_on "imake" => :build

  def install
    inreplace "xtt.c" do |s|
      s.gsub! "<stdio.h>", "<stdio.h>\n#include <stdlib.h>"
      s.gsub! "extern getenv()", "char *getenv(const char *name)"
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
        "#{home}/.xtt".
      
      An example file is located in:
        #{doc}/xtt/example.xtt
    EOS
  end
  
  test do
    system "false"
  end
end
