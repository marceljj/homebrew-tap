class Libzahl < Formula
  version "1.0"
  desc "Big integer library"
  homepage "https://libs.suckless.org/libzahl"
  url "https://git.suckless.org/libzahl", branch: "main"
  license "ISC"

  depends_on "automake" => :build
  
  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
