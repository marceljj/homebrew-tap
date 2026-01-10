class Lchat < Formula
  version "1.0"
  desc "A line oriented front end for ii-like chat programs"
  homepage "https://tools.suckless.org/lchat"
  url "https://dl.suckless.org/tools/lchat-#{version}.tar.gz"
  sha256 "89247b5c8e853bbfc2f97909b1926fadf44d637543767e77e9e42e72242f375f"
  license :public_domain

  depends_on "libgrapheme"

  def install
    inreplace "config.mk", "$(PREFIX)/man", "$(PREFIX)/share/man"
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
