class Tabbed < Formula
  version "0.9"
  desc "A simple generic tabbed frontend to xembed-aware applications"
  homepage "https://tools.suckless.org/tabbed"
  url "https://dl.suckless.org/tools/tabbed-#{version}.tar.gz"
  sha256 "0acf87457b7419e66fbfa3a9cec95ffb46d254c6b88b5e4bb7cc18c3a92008a8"
  license all_of: ["MIT", "X11"]

  depends_on "freetype"
  depends_on "libx11"
  depends_on "libxt"

  def install
    inreplace "Makefile" do |s|
      s.gsub! "TABBED_CFLAGS = -I/usr/X11R6/include -I/usr/include/freetype2", "TABBED_CFLAGS = -I#{Formula["libx11"].opt_include} -I#{Formula["libxt"].opt_include} -I#{Formula["freetype"].opt_include}"
      s.gsub! "TABBED_LDFLAGS = -L/usr/X11R6/lib", "TABBED_LDFLAGS = -L#{Formula["libx11"].opt_lib -L#{Formula["libxt"].opt_lib -L#{Formula["freetype"].opt_lib"
    end
    
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
