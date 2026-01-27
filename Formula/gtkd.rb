class Gtkd < Formula
  version "3.11.0"
  desc "D binding and OO wrapper of GTK+"
  homepage "https://gtkd.org/"
  url "https://github.com/gtkd-developers/GtkD/archive/refs/tags/v#{version}.tar.gz"
  sha256 "123"
  license "LGPL-3.0-or-later"

  depends_on "ldc" => :build
  depends_on "make" => :build
  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "librsvg"
  
  def install
    system "gmake", "PREFIX=#{prefix}"
    system "gmake", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
