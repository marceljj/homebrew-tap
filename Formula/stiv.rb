class Stiv < Formula
  version "git-2023.01"
  desc "Suckless terminal image viewer"
  homepage "https://github.com/radare/tiv"
  url "https://github.com/radare/tiv.git", branch: "master"
  license "BSD-3-Clause"

  def install
    system "make", "PREFIX=#{prefix}"
    bin.install "stiv"
    bin.install "stiv-jpeg"
  end

  test do
    system "false"
  end
end
