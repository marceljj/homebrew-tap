class Fet.sh < Formula
  version "1.0"
  desc "A program which provides personal finance tracking and performance capabilities"
  homepage "https://github.com/eepykate/fet.sh"
  url "https://github.com/eepykate/fet.sh.git", branch: "master"

  def install
    bin.install "fet.sh"
    (share/"doc/fet.sh").install "LICENSE"
    (share/"doc/fet.sh").install "README.md"
  end

  test do
    system "false"
  end
end
