class Sent < Formula
  version "1"
  desc "Simple plaintext presentation tool"
  homepage "https://tools.suckless.org/sent"
  url "https://dl.suckless.org/tools/sent-#{version}.tar.gz"
  sha256 "7bf3de9311ce291ff36adf5315b78fa72373e3ab80ca71387fb5884bcbd7be33"
  license "ISC"

  depends_on "farbfeld"
  depends_on "libx11"
  
  def install
    inreplace "config.mk" do |s|
      s.gsub! "PREFIX = /usr/local", "PREFIX = #{prefix}"
      s.gsub! "-I${X11INC}", "-I$(brew --prefix)/include -I$(brew --prefix)/include/freetype2"
      s.gsub! "-L${X11LIB}", "-L$(brew --prefix)/lib"
    end
    
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
