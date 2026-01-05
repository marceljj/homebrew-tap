class Micropolis < Formula
  version "0.9.12"
  desc "The city simulator"
  homepage "https://git.zerfleddert.de/git/micropolis"
  url "https://git.zerfleddert.de/git/micropolis", branch: "master"
  license "GPL-3.0"

  depends_on "libx11"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end
  
  test do
    system "false"
  end
end
