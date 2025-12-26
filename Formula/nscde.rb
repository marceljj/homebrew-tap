class Nscde < Formula
  version "2.3"
  desc "Modern and functional CDE desktop based on FVWM"
  homepage "https://github.com/NsCDE/NsCDE"
  url "https://github.com/NsCDE/NsCDE/archive/refs/tags/#{version}.tar.gz"
  sha256 "fc4fd5f16b901b865f44b7483fa01a28189b5d5b95766375e026cc317456b297"
  license "GPL-3.0"

  depends_on "libx11"
  depends_on "libxpm"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
