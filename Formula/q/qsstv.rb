class Qsstv < Formula
  version "10.0.0"
  desc "Receive and transmit images over radio using analog SSTV or digital DRM"
  homepage "https://github.com/tomtastic/QSSTV"
  url "https://github.com/tomtastic/QSSTV/archive/refs/tags/beta.tar.gz"
  sha256 "d211d99daa4c3be158e52fcf07089e698c5bccdffb9076890537d38a2545dbbb"
  license "GPL-3.0"

  depends_on "qtbase" => :build
  depends_on "fftw"
  depends_on "hamlib"
  depends_on "openjpeg"
  depends_on "qt"
  
  def install
    system "qmake"
    system "make"
    on_macos do
      bin.install "src/qsstv.app/Contents/MacOS/qsstv"
    end
    on_linux do
      bin.install "src/qsstv"
    end
    
    (share/"applications").install "qsstv.desktop"
    doc.install "LICENSE"
    doc.install "README.md"

  test do
    system "false"
  end
end
