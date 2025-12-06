class Galculator < Formula
  version "2.15"
  desc "GTK based scientific calculator"
  homepage "https://github.com/galculator/galculator"
  url "https://github.com/galculator/galculator.git", branch: "master"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "flex"
  depends_on "gtk+3"
  depends_on "intltool"
  depends_on "libtool"
  depends_on "make"
  
  def install
    system "glibtoolize", "--force", "--copy"
    system "intltoolize", "--force", "--copy", "--automake"
    system "autoheader"
    system "automake", "--add-missing", "--gnu", "--copy"
    system "autoconf"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
