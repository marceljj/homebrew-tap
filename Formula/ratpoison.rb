class Ratpoison < Formula
  version "1.4.9"
  desc "A simple Window Manager with no fat library dependencies, no fancy graphics, no window decorations, and no rodent dependence"
  homepage "https://www.nongnu.org/ratpoison"
  url "http://download.savannah.nongnu.org/releases/ratpoison/ratpoison-#{version}.tar.xz"
  sha256 "d98fa4be025ecca453c407ff311ab3949f29f20d6d8abedf8f0716b85fc8d1f1"
  license "GPL-2.0"

  depends_on "libx11"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
