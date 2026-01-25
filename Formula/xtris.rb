class Xtris < Formula
  version "1.15"
  desc "A multi-player version of Tetris for the X Window system"
  homepage "https://ftp.netbsd.org/pub/pkgsrc/distfiles/xtris-#{version}.tar.gz"
  url "https://ftp.netbsd.org/pub/pkgsrc/distfiles/xtris-#{version}.tar.gz"
  sha256 "5791b30795382a18536201c95c686f62ade6975fc4e63c651bff36226c933d68"
  license "GPL-2.0"

  depends_on "libx11"
  
  def install
    inreplace "Makefile" do |s|
      s.gsub! "XLIBS = -lX11", "XLIBS = -lX11 -L#{Formula["libx11"].opt_lib} -I#{Formula["libx11"].opt_include}"
    end
    
    system "make"
    bin.install "xtbot"
    bin.install "xtris"
    bin.install "xtserv"
    man6.install "xtbot.6"
    man6.install "xtris.6"
    man6.install "xtserv.6"
    doc.install "ChangeLog"
    doc.install "COPYING"
    doc.install "PROTOCOL"
    doc.install "README"
  end

  test do
    system "false"
  end
end
