class Libtakum < Formula
  version "2.0.0"
  desc "Takum arithmetic C99 reference implementation"
  homepage "https://takum.org"
  url "https://github.com/takum-arithmetic/libtakum/archive/refs/tags/v#{version}.tar.gz"
  sha256 "f17bf48bd94738b796940ac00a705ddc7a858968f8ae59ca0e8128a4b164f4f4"
  license "ISC"

  def install
    inreplace "config.mk", "/usr/local", "#{prefix}"

    system "./configure"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
