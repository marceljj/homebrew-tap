class AsciiViewer3d < Formula
  version "1.4.0"
  desc "Viewer of 3D models in ASCII without graphic libraries"
  homepage "https://audacious-media-player.org"
  url "https://github.com/autopawn/3d-ascii-viewer/archive/refs/tags/v#{version}.tar.gz"
  sha256 "c390cbd4c80f6a7c5bdd9cab02174aaa8d63c0eeb18134deb8ed85463395d81c"
  license "MIT"

  def install
    system "make"
    bin.install "3d-ascii-viewer"
    doc.install "LICENSE"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
