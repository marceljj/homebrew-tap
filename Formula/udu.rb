class Udu < Formula
  version "0.6.91"
  desc "Extremely fast command-line disk usage analyzer"
  homepage "https://github.com/gnualmalki/udu"
  url "https://github.com/gnualmalki/udu/archive/refs/tags/udu@#{version}.tar.gz"
  license "GPL-3.0-or-later"

  depends_on "libomp"
  
  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
    doc.install "LICENSE"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
