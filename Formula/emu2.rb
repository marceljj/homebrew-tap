class Emu2 < Formula
  version "git-2025.11"
  desc "Simple x86 and DOS emulator for the UNIX terminal"
  homepage "https://github.com/dmsc/emu2"
  url "https://github.com/dmsc/emu2.git", branch: "master"
  license "GPL-2.0"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
    (share/"doc").install "LICENSE"
    (share/"doc").install "README.md"
  end

  test do
    system "false"
  end
end
