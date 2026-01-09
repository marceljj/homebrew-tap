class Libixp < Formula
  version "git-2025.12"
  desc "Portable, simple C-language 9P client and server libary"
  homepage "https://code.google.com/archive/p/libixp"
  url "https://github.com/0intro/libixp.git", branch: "main"
  license "MIT"
  
  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
