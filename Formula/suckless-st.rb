class SucklessSt < Formula
  version "0.9.3"
  desc "A simple terminal implementation for X"
  homepage "https://tools.suckless.org/st"
  url "https://dl.suckless.org/st/st-#{version}.tar.gz"
  sha256 "9ed9feabcded713d4ded38c8cebf36a3b08f0042ef7934a0e2b2409da56e649b"
  license all_of: ["MIT", "X11"]

  depends_on "pkgconf" => :build
  depends_on "fontconfig" => :build
  depends_on "freetype"
  depends_on "libpng"
  depends_on "libx11"
  depends_on "libxft"

  conflicts_with "schemathesis", because: "both install `st` binaries"
  conflicts_with "st", because: "both install `st` binaries"

  def install
    on_macos do
      inreplace "config.mk" do |s|
        s.gsub! "LIBS = -L$(X11LIB) -lm -lrt", "LIBS = -L#{Formula["libx11"].opt_lib} -L#{Formula["libxft"].opt_lib} -L#{Formula["libpng"].opt_lib} -lm"
      end
    end
    on_linux do
      inreplace "config.mk" do |s|
        s.gsub! "LIBS = -L$(X11LIB)", "LIBS = -L#{Formula["libx11"].opt_lib} -L#{Formula["libxft"].opt_lib} -L#{Formula["libpng"].opt_lib}"
      end
    end
    
    inreplace "config.mk" do |s|
      s.gsub! "PREFIX = /usr/local", "PREFIX = #{prefix}"
      s.gsub! "INCS = -I$(X11INC)", "INCS = -I#{Formula["libx11"].opt_include} -I#{Formula["libxft"].opt_include} -I#{Formula["libpng"].opt_include}\libpng16"
    end

    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
    
    doc.install "FAQ"
    doc.install "LEGACY"
    doc.install "LICENSE"
    doc.install "README"
    doc.install "TODO"
  end

  test do
    system "false"
  end
end
