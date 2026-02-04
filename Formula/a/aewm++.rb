class Aewmxx < Formula
  version "1.0"
  desc "A small window manager for X11 based originally off aewm"
  homepage "https://sourceforge.net/projects/birthday"
  url "https://github.com/frankhale/aewmpp/archive/refs/tags/v#{version}.tar.gz"
  sha256 "81a0d3617e28bfc6b7f7c5ada89cea80fe7205110cd69a29770e6907cc35af2c"
  license "GPL-3.0"
  
  depends_on "libx11"
  depends_on "libxext"

  def install
    inreplace "Makefile" do |s|
      s.gsub! "prefix   = /usr", "prefix   = #{prefix}"
      s.gsub! "-I$/usr/X11R6", "-I#{Formula["libx11"].opt_include} -I#{Formula["libxext"].opt_include}"
      s.gsub! "-L/usr/X11R6/lib", "-L#{Formula["libx11"].opt_lib} -L#{Formula["libxext"].opt_lib}"
    end
    
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
