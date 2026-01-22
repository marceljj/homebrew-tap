class Oneko < Formula
  version "1.2.sakura.5"
  desc "An ancient Motif-based toolbar for X11"
  homepage "http://www.daidouji.com/oneko"
  url "http://www.daidouji.com/oneko/distfiles/oneko-#{version}.tar.gz"
  sha256 "2c2e05f1241e9b76f54475b5577cd4fb6670de058218d04a741a04ebd4a2b22f"
  license :public_domain
  
  depends_on "imake" => :build
  depends_on "libx11"

  def install
    inreplace "oneko.c" do |s|
      s.gsub! "\"patchlevel.h\"", "\"patchlevel.h\"\n#include <unistd.h>"
      s.gsub! "GetResources()\n{", "int GetResources()\n{"
      s.gsub! "MakeMouseCursor()\n{", "int MakeMouseCursor()\n{"
      s.gsub! "SetupColors()\n{", "int SetupColors()\n{"
    end
    
    system "xmkmf"
    system "make"
    bin.install "oneko"
    man6.install "oneko.man" => "oneko.6"

    doc.install "README"
    doc.install "README-NEW"
    doc.install "README-SUPP"
  end

  test do
    system "false"
  end
end
