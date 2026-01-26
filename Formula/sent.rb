class Sent < Formula
  version "1"
  desc "A simple plaintext presentation tool"
  homepage "https://tools.suckless.org/sent"
  url "https://dl.suckless.org/tools/sent-#{version}.tar.gz"
  sha256 "7bf3de9311ce291ff36adf5315b78fa72373e3ab80ca71387fb5884bcbd7be33"
  license "ISC"

  depends_on "farbfeld"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "libx11"
  depends_on "libxft"
  
  def install
    inreplace "config.mk" do |s|
      s.gsub! "PREFIX = /usr/local", "PREFIX = #{prefix}"
      s.gsub! "-I/usr/include -I/opt/X11/include/freetype2 -I${X11INC}", "-I#{Formula["libx11"].opt_include} -I#{Formula["libxft"].opt_include} -I#{Formula["freetype"].opt_include}/freetype2"
      s.gsub! "-L/usr/lib", "-L#{Formula["libx11"].opt_lib} -L#{Formula["libxft"].opt_lib} -L#{Formula["freetype"].opt_lib}""
    end

    system "make"
    system "make", "install"
    
    doc.install "LICENSE"
    doc.install "README.md"
    (doc/"examples").install "example"
    (doc/"examples").install "nyan.png"
    (doc/"examples").install "transparent_test.ff"
  end

  test do
    system "false"
  end
end
