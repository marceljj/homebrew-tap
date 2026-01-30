class Sxwm < Formula
  version "1.7"
  desc "A simple feature-rich dynamic tiling window manager"
  homepage "https://mallocd.com/projects/sxwm.html"
  url "https://github.com/uint23/sxwm/archive/refs/tags/v#{version}.tar.gz"
  sha256 "874f28d2a5c625fc4a7d91aae7a96a58760ff64fa223a3398048a18071219570"
  license "GPL-3.0"

  depends_on "libx11"
  depends_on "libxcursor"
  depends_on "libxinerama"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "PREFIX=#{prefix}", "install"
  end
  
  test do
    system "false"
  end
end
