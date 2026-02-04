class Gcal < Formula
  version "4.1"
  desc "A program for calculating and printing calendars"
  homepage "https://www.gnu.org/software/gcal"
  url "https://ftp.gnu.org/gnu/gcal/gcal-#{version}.tar.gz"
  license "GPL-3.0"
  sha256 "363cdb016125bd64cfe5fcaa28b4b828fdfe88b1ee76d9f58ba9ea120587bb39"

  uses_from_macos "curl" => :build
  
  def install
    inreplace "src/tty.c", "if HAVE_SYS_IOCTL_H && !defined(TIOCGWINSZ)", "if HAVE_SYS_IOCTL_H"
    inreplace "src/utils.c", "mayname = (char *) my_malloc (len,", "mayname = (char *) my_malloc (len + 2,"

    system "curl", "-O", "https://dyn.manpages.debian.org/stable/gcal/gcal.1.en.gz"
    system "curl", "-O", "https://dyn.manpages.debian.org/stable/gcal/gcal2txt.1.en.gz"
    system "curl", "-O", "https://dyn.manpages.debian.org/stable/gcal/tcal.1.en.gz"
    system "curl", "-O", "https://dyn.manpages.debian.org/stable/gcal/txt2gcal.1.en.gz"
    
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
    man1.install "gcal.1.en.gz" => "gcal.1.gz"
    man1.install "gcal2txt.1.en.gz" => "gcal2tzt.gz"
    man1.install "tcal.1.en.gz" => "tcal.1.gz"
    man1.install "txt2gcal.1.en.gz" => "txt2gcal.1.gz"
  end

  test do
    system "false"
  end
end
