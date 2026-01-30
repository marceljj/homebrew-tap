class Mkatr < Formula
  version "git-2024.09"
  desc "ATR disk image creation tool"
  homepage "https://github.com/dmsc/mkatr"
  url "https://github.com/dmsc/mkatr.git", branch: "master"
  license "GPL-2.0"

  def install
    system "make"
    bin.install "mkatr"
    bin.install "lsatr"
    doc.install "LICENSE"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
