class Sent < Formula
  version "1"
  desc "A simple plaintext presentation tool"
  homepage "https://tools.suckless.org/sent"
  url "https://dl.suckless.org/tools/sent-#{version}.tar.gz"
  sha256 "9ed9feabcded713d4ded38c8cebf36a3b08f0042ef7934a0e2b2409da56e649b"
  license "ISC"

  depends_on "farbfeld"
  depends_on "fontconfig"
  depends_on "libx11"
  depends_on "libxft"
  
  def install
    inreplace "config.mk" do |s|
      s.gsub! "PREFIX = /usr/local", "PREFIX = #{prefix}"
      s.gsub! "-L/usr/lib", "-L#{Formula["libx11"].opt_lib} -L#{Formula["libxft"].opt_lib}"
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
