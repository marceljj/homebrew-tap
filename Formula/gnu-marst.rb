class GnuMarst < Formula
  version "2.8"
  desc "An Algol-to-C translator"
  homepage "https://www.gnu.org/software/marst"
  url "https://ftp.gnu.org/gnu/marst/marst-#{version}.tar.gz"
  sha256 "1b9066526a368df8e337c507f8896e9aeac59da16933eccd473b07a2bc8617b6"
  license "GPL-3.0"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
