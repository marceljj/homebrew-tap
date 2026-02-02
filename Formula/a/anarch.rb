class Anarch < Formula
  version "git-2023.09"
  desc "The suckless FPS game"
  homepage "https://gitlab.com/drummyfish/anarch"
  url "https://gitlab.com/drummyfish/anarch.git", branch: "master"
  license "CC0-1.0"

  def install
    inreplace "make.sh", "-std=c99", "$(sdl2-config --cflags --libs)"
    system "./make.sh", "sdl"
    bin.install "anarch"
    
    doc.install "IDEAS.txt"
    doc.install "LICENSE"
    doc.install "README.md"
    doc.install "TODO.txt"
  end

  test do
    system "false"
  end
end
