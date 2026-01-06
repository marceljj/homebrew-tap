class Libzahl < Formula
  version "git-2022.07"
  desc "Big integer library"
  homepage "https://libs.suckless.org/libzahl"
  url "https://git.suckless.org/libzahl", branch: "main"
  license "ISC"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
