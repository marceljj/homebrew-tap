class FetSh < Formula
  version "1.0"
  desc "A fetch written in POSIX shell without any external commands"
  homepage "https://github.com/eepykate/fet.sh"
  url "https://github.com/eepykate/fet.sh.git", branch: "master"
  license "ISC"

  def install
    bin.install "fet.sh"
    doc.install "LICENSE"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
