class Udu < Formula
  desc "An extremely fast command-line disk usage analyzer"
  homepage "https://github.com/gnualmalki/udu"
  url "https://github.com/gnualmalki/udu.git", branch: "main"
  license "GPL-3.0"
  version "0.6.6"

  depends_on "gcc"
  depends_on "libomp"
  depends_on "make"

  def install
    system "gmake CC=gcc-15 -B"
    bin.install "udu"
    man1.install "udu.1"
    (share/"doc/udu").install "COPYING"
    (share/"doc/udu").install "README.md"
  end

  test do
    system "false"
  end
end
