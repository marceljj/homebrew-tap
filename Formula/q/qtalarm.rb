class Qtalarm < Formula
  version "3.0.1"
  desc "A nifty alarm clock written in QT"
  homepage "https://github.com/CountMurphy/QTalarm"
  url "https://github.com/CountMurphy/QTalarm/archive/refs/tags/#{version}.tar.gz"
  sha256 "c259f8665336fd6b418a9aeaf98618cff3c508cbcdb2d466e4dbd598c338ef59"
  license "GPL-3.0"

  depends_on "qtbase" => :build
  depends_on "qt"
  
  def install
    system "qmake"
    system "make"
    on_macos do
      bin.install "qtalarm.app/Contents/MacOS/qtalarm"
    end
    on_linux do
      bin.install "qtalarm"
    end
    
    (share/"icons/16x16/apps").install "Icons/1349069370_Alarm_Clock16.png" => "QTalarm.png"
    (share/"icons/24x24/apps").install "Icons/1349069370_Alarm_Clock24.png" => "QTalarm.png"
    (share/"icons/48x48/apps").install "Icons/1349069370_Alarm_Clock.png" => "QTalarm.png"
    (share/"applications/qtalarm.desktop").write <<~EOS
      [Desktop Entry]
      Encoding=UTF-8
      Value=1.0
      Type=Application
      Name=QTalarm
      GenericName=QTalarm
      Comment=A nifty alarm clock written in QT
      Icon=QTalarm.png
      Exec=qtalarm
      Categories=Application;Utility;
    EOS
  end

  test do
    system "false"
  end
end
