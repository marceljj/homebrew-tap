class Xarclock < Formula
  version "1.0"
  desc "An extension of the standard X clock widget"
  homepage "https://x11cp.org/apps/xarclock"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "imake" => :build
  depends_on "libx11"
  depends_on "libxaw"
  depends_on "libxmu"
  depends_on "libxt"
  
  def install
    Dir.chdir("src/xarclock") do
      inreplace "ARClock.c" do |s|
        s.gsub! "static erase_hands(), round();", "int static erase_hands(), round();"
        s.gsub! "register i, j;", "int register i, j;"
        s.gsub! "static erase_hands (w, tm)", "int static erase_hands (w, tm)"
      end
      inreplace "xarclock.c" do |s|
        s.gsub! "#include <X11/Xatom.h>", "#include <stdio.h>\n#include <X11/Xatom.h>"
        s.gsub! "Syntax(call)", "int Syntax(call)"
      end
      
      system "xmkmf"
      system "make"
      bin.install "xarclock"
      
      doc.install "README"
    end
  end

  test do
    system "false"
  end
end
