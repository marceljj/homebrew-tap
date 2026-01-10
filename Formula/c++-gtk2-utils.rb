class CxxGtk2Utils < Formula
  version "2.2.20"
  desc "lightweight library containing a number of classes and functions for programming GTK2 programs using C++ in POSIX environments"
  homepage "https://cxx-gtk-utils.sourceforge.net"
  url "https://downloads.sourceforge.net/project/cxx-gtk-utils/cxx-gtk-utils/#{version}/c%2B%2B-gtk-utils-#{version}.tar.gz"
  sha256 "a64e03e5948d074f8309b036ca0acaf9ae4025c19cef6174f2319c504fb32d8c"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"

  def install
    system "./configure-gtk2", "--docdir=#{doc}/c++-gtk2-utils", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
