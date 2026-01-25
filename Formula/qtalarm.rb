class Qtalarm< Formula
  version "3.0.1"
  desc "A handy alarm clock Program written in QT"
  homepage "https://github.com/CountMurphy/QTalarm"
  url "https://github.com/CountMurphy/QTalarm/archive/refs/tags/#{version}.tar.gz"
  sha256 "123"
  license "GPL-3.0"

  depends_on "qtbase" => :build
  depends_on "qt@5"
  
  def install
    bin.install "fet.sh"
    doc.install "LICENSE"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
