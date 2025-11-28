class Motti < Formula
  desc "Conquer enemies' capitals by occupying and encircling their territories. The game map is an array of square cells."
  homepage "https://www.gnu.org/software/motti/"
  url "https://ftp.gnu.org/gnu/motti/motti-3.1.1.tar.gz"
  license "GPL-3.0"
  version "3.1.1"
  sha256 "632d9a84d3b2e3eee4c9d9199d66d42576516ea6c291058c01830ae2fb7de429"

  depends_on "make"

  def install
    system "./configure --prefix=$HOMEBREW_PREFIX"
    system "make"
    system "make install"
  end

  test do
    system "false"
  end
end
