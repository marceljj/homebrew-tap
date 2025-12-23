class GnuGcal < Formula
  version "4.1"
  desc "A program for calculating and printing calendars"
  homepage "https://www.gnu.org/software/gcal"
  url "https://ftp.gnu.org/gnu/gcal/gcal-#{version}.tar.gz"
  license "GPL-3.0"
  sha256 "363cdb016125bd64cfe5fcaa28b4b828fdfe88b1ee76d9f58ba9ea120587bb39"

  resource "manpages" do
    version "4.1"
    url "http://deb.debian.org/debian/pool/main/g/gcal/gcal_#{version}.orig.tar.gz"
    sha256 "363cdb016125bd64cfe5fcaa28b4b828fdfe88b1ee76d9f58ba9ea120587bb39"
  end
  
  def install
    inreplace "src/tty.c", "if HAVE_SYS_IOCTL_H && !defined(TIOCGWINSZ)", "if HAVE_SYS_IOCTL_H"
    inreplace "src/utils.c", "mayname = (char *) my_malloc (len,", "mayname = (char *) my_malloc (len + 2,"
    
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
