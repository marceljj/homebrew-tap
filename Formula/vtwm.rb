class Ninewm < Formula
  version "1.4.2"
  desc "X11 Window Manager inspired by Plan 9's rio"
  homepage "https://github.com/9wm/9wm"
  url "https://github.com/9wm/9wm/archive/refs/tags/#{version}.tar.gz"
  sha256 "7c7b9c6510de633af7ab46e9f85bb8ed916b021d012482e5ca01651be55b79f6"
  license "MIT"

  depends_on "libx11"
  depends_on "libxext"

  def install
    system "make", "PREFIX=#{prefix}"
    bin.install "9wm"
    man1.install "9wm.man" => "9wm.1"
  end
  
  test do
    system "false"
  end
end
