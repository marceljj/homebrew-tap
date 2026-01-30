class Farbfeld < Formula
  version "4"
  desc "A lossless image format which is easy to parse, pipe and compress"
  homepage "https://tools.suckless.org/farbfeld"
  url "https://dl.suckless.org/farbfeld/farbfeld-#{version}.tar.gz"
  sha256 "c7df5921edd121ca5d5b1cf6fb01e430aff9b31242262e4f690d3af72ccbe72a"
  license "ISC"

  depends_on "libpng"
  depends_on "jpeg-turbo"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
