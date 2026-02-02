class Karmen < Formula
  version "0.15"
  desc "A Window Manager for X"
  homepage "https://karmen.sourceforge.net"
  url "https://downloads.sourceforge.net/project/karmen/karmen/#{version}/karmen-#{version}.tar.gz"
  sha256 "29b7fa1da581d3a22d6db82ce6b6b6e396be9b6b0af2091b8c043040e6e2b980"
  license "MIT"

  depends_on "libx11"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
