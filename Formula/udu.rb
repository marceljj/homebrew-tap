class Udu < Formula
  version "0.6.91"
  desc "Extremely fast command-line disk usage analyzer"
  homepage "https://github.com/gnualmalki/udu"
  url "https://github.com/gnualmalki/udu/archive/refs/tags/udu@#{version}.tar.gz"
  sha256 "7035f9fb518b2cb2ab4d9b5ba3e56c1a75cda1b98e07a2fbb66c9935d61d57e6"
  license "GPL-3.0-or-later"

  depends_on "libomp"
  depends_on "llvm"

  on_macos do
    depends_on "make"
  end

  conflicts_with "uutils-coreutils", because: "uutils-coreutils installs a conflicting 'udu' binary"
  
  def install
    on_macos do
      system "gmake", "CC=clang-21", "-B"
    end
    on_linux do
      system "make", "CC=clang-21", "-B"
    end
    
    bin.install "udu"
    man1.install "udu.1"
    doc.install "BENCHMARKS.md"
    doc.install "COPYING"
    doc.install "README.md"
    doc.install "VERSION"
  end

  test do
    system "false"
  end
end
