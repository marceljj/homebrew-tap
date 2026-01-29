class TidalDl < Formula
  include Language::Python::Virtualenv

  version "2022.08.29.1"
  desc "An application that lets you download videos and tracks from Tidal"
  homepage "http://doc.yaronzz.com/post/tidal_dl_installation"
  url "https://github.com/yaronzz/Tidal-Media-Downloader/archive/refs/tags/#{version}.tar.gz"
  sha256 "f74722b8f70e720abc74eb68d79deec13803b7506504feeb7e564aa6a74d3491"
  license "Apache-2.0"

  depends_on "ffmpeg"
  depends_on "pyqt@5"
  depends_on "python@3"

  def install
    virtualenv_install_with_resources
  end
end
