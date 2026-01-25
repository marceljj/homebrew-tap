class Qtalarm< Formula
  version "3.0.1"
  desc "A handy alarm clock Program written in QT"
  homepage "https://github.com/CountMurphy/QTalarm"
  url "https://github.com/CountMurphy/QTalarm/archive/refs/tags/#{version}.tar.gz"
  sha256 "c259f8665336fd6b418a9aeaf98618cff3c508cbcdb2d466e4dbd598c338ef59"
  license "GPL-3.0"

  depends_on "qtbase" => :build
  depends_on "qt@5"
  
  def install
    system "qmake"
    system "make"
    
  end

  test do
    system "false"
  end
end
