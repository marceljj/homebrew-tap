class GnuCursynth < Formula
  version "1.4"
  desc "A polyphonic music synthesizer that runs graphically inside your terminal"
  homepage "https://www.gnu.org/software/cursynth"
  url "ftp://ftp.gnu.org/gnu/cursynth/cursynth-latest.tar.gz"
  sha256 "1b9066526a368df8e337c507f8896e9aeac59da16933eccd473b07a2bc8617b6"
  license "GPL-3.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  on_macos do
    depends_on "gettext"
  end

  def install
    system "autoreconf", "-fi"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
