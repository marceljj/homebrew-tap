class GnuGcal < Formula
  version "4.1"
  desc "A program for calculating and printing calendars"
  homepage "https://www.gnu.org/software/gcal"
  url "https://ftp.gnu.org/gnu/gcal/gcal-#{version}.tar.gz"
  license "GPL-3.0"
  sha256 "882f11aa170beb77ff4939cc330fb6f37d1bbec2510410a12feb6eef548ca025"

  patch do
      url "https://marceljj.org/pkg/patch/gnu-gcal/tty.c.patch"
      sha256 "6a5882265cdd9ea55597c45504efc9ea6b5f262f1ecfdec245c25cb4a91dcd73"
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
