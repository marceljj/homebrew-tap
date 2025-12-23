class GnuGcal < Formula
  version "4.1"
  desc "Conquer enemies' capitals by occupying and encircling their territories"
  homepage "https://www.gnu.org/software/motti"
  url "https://ftp.gnu.org/gnu/gcal/gcal-#{version}.tar.gz"
  license "GPL-3.0"
  sha256 "363cdb016125bd64cfe5fcaa28b4b828fdfe88b1ee76d9f58ba9ea120587bb39"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
