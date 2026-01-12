class Ded < Formula
  version "12.0"
  desc "A directory editor for UNIX systems"
  homepage "https://invisible-island.net/ded"
  url "https://invisible-island.net/datafiles/release/ded.tar.gz"
  sha256 "b5bfb0850a70f3b1e64c9736e73d00788442bfc4c273b5b3d13f68f454a8c530"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "td-lib"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
