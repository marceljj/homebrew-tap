class Sowm < Formula
  version "1.6"
  desc "An itsy bitsy floating window manager (220~ sloc!)"
  homepage "https://github.com/dylanaraps/sowm"
  url "https://github.com/dylanaraps/sowm/archive/refs/tags/#{version}.tar.gz"
  license "MIT"

  depends_on "libx11"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}
  end
  
  test do
    system "false"
  end
end
