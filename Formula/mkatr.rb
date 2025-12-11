class Mkatr < Formula
  version "git-2024.9"
  desc "ATR disk image creation tool"
  homepage "https://github.com/dmsc/mkatr"
  url "https://github.com/dmsc/mkatr.git", branch: "master"
  license "GPL-2.0"

  def install
    system "make"
    bin.install "mkatr"
    bin.install "lsatr"
    (share/"doc/mkatr").install "LICENSE"
    (share/"doc/mkatr").install "README.md"
  end

  test do
    system "false"
  end
end
