class Larswm < Formula
  version "0.22pl3"
  desc "A rewrite of 9wm that adds automatic tiling, virtual desktops and many more features"
  homepage "http://porneia.free.fr/larswm/larswm.html"
  url "https://ftp.lysator.liu.se/pub/X11/wm/amiwm/amiwm#{version}.tar.gz"
  sha256 "6c3dc08d84cf43cefefb90a884d3dde9a546d71e3d994286f5efd23fc7dca253"
  license "MIT"

  depends_on "imake"
  depends_on "libx11"

  def install
    system "xmkmf"
  end
  
  test do
    system "false"
  end
end
