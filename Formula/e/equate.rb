class Equate < Formula
  version "2017.08"
  desc "A calculator based on EFL"
  homepage "https://git.enlightenment.org/vtorri/equate"
  url "https://git.enlightenment.org/vtorri/equate.git", branch: "master"
  license "MIT"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "efl"

  def install
    ENV["DESTDIR"] = "/"

    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
