class AewFspanel < Formula
  version "1.0"
  desc "A tiny panel that lists all your windows"
  homepage "https://packages.debian.org/source/stable/aewm++-goodies"
  url "http://deb.debian.org/debian/pool/main/a/aewm++-goodies/aewm++-goodies_#{version}.orig.tar.bz2"
  sha256 "6e466113adb96921e398ab4a87914269abc475597f9ba7950755cd50279388ae"
  license "GPL-3.0"
  
  depends_on "libx11"
  depends_on "libxpm"

  def install
    inreplace "Makefile" do |s|
      s.gsub! "prefix   = /usr", "prefix   = #{prefix}"
      s.gsub! "-I/usr/X11R6/include", "-I#{Formula["libx11"].opt_include} -I#{Formula["libxpm"].opt_include}"
      s.gsub! "-L/usr/X11R6/lib", "-L#{Formula["libx11"].opt_lib} -L#{Formula["libxpm"].opt_lib}"
    end

    system "make"
    system "make", "install"
    doc.install "Changelog"
    doc.install "COPYING"
    doc.install "README"
  end

  test do
    system "false"
  end
end
