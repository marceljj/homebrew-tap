class Bspwm < Formula
  version "0.9.12"
  desc "A tiling window manager based on binary space partitioning"
  homepage "https://github.com/baskerville/bspwm"
  url "https://github.com/baskerville/bspwm.git", branch: "master"
  license "BSD-2-Clause"

  depends_on "libx11"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end
  
  test do
    system "false"
  end
end
