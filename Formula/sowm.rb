class Sowm < Formula
  version "1.6"
  desc "An itsy bitsy floating window manager (220~ sloc!)"
  homepage "https://github.com/dylanaraps/sowm"
  url "https://github.com/dylanaraps/sowm/archive/refs/tags/#{version}.tar.gz"
  sha256 "7e1d1391f8cf8d1b04458d0b4bb3b61684b535dddcc1dd7d37266e81efd57e02"
  license "MIT"

  depends_on "libx11"

  def install
    system "make", "PREFIX=#{prefix}"
    bin.install "sowm"
    doc.install "LICENSE.md"
    doc.install "README.md"
  end
  
  test do
    system "false"
  end
end
