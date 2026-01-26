class St < Formula
  version "0.9.3"
  desc "A simple generic tabbed frontend to xembed-aware applications"
  homepage "https://tools.suckless.org/st"
  url "https://dl.suckless.org/tools/st-#{version}.tar.gz"
  sha256 "0acf87457b7419e66fbfa3a9cec95ffb46d254c6b88b5e4bb7cc18c3a92008a8"
  license all_of: ["MIT", "X11"]

  depends_on "pkgconf" => :build
  depends_on "fontconfig" => :build
  depends_on "freetype"
  depends_on "libpng"
  depends_on "libx11"
  depends_on "libxft"

  def install
    inreplace "config.mk" do |s|
      s.gsub "PREFIX = /usr/local", "PREFIX = #{prefix}"
      s.gsub! "INCS = -I$(X11INC)", "INCS = -I#{Formula["libx11"].opt_include} -I#{Formula["libxft"].opt_include} -I#{Formula["libpng"].opt_include}\libpng16"
      s.gsub! "LIBS = -L$(X11LIB)", "LIBS = -L#{Formula["libx11"].opt_lib} -L#{Formula["libxft"].opt_lib} -L#{Formula["libpng"].opt_lib}"
    end
    
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
