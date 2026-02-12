class Preditor < Formula
  version "0.1.2"
  desc "An image preview application with basic editing"
  homepage "https://github.com/rabfulton/preditor"
  url "https://github.com/rabfulton/preditor/archive/refs/tags/#{version}.tar.gz"
  sha256 "cc999fa1a6824c029532dba0bed6e6510bb2a9c2ba9c46759b2d9e7eaf76cc0c"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "gdk-pixbuf"
  depends_on "glib"
  depends_on "gtk+3"
  
  def install
    system "make", "release", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
