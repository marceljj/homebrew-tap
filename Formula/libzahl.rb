class Libzahl < Formula
  version "1.0"
  desc "Big integer library"
  homepage "https://libs.suckless.org/libzahl"
  url "https://git.suckless.org/libzahl"
  sha256 "b13042e0ba7944bb72a2aae9163279e48f7d3e01e4776bd48727cd12d0b0d462"
  license "ISC"

  def install
    inreplace "config.mk", "/usr/local", "#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
