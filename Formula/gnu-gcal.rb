class GnuGcal < Formula
  version "4.1"
  desc "A program for calculating and printing calendars"
  homepage "https://www.gnu.org/software/gcal"
  url "https://ftp.gnu.org/gnu/gcal/gcal-#{version}.tar.gz"
  license "GPL-3.0"
  sha256 "363cdb016125bd64cfe5fcaa28b4b828fdfe88b1ee76d9f58ba9ea120587bb39"

  patch do
      url "https://marceljj.org/pkg/patch/gnu-gcal/tty.c.patch"
      sha256 "882f11aa170beb77ff4939cc330fb6f37d1bbec2510410a12feb6eef548ca025"
  end
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
