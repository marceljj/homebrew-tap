class Libhx < Formula
  version "5.2"
  desc "A C and C++ library full of utility functions"
  homepage "https://inai.de/projects/libhx"
  url "https://codeberg.org/jengelh/libhx/releases/download/v#{version}/libHX-#{version}.tar.zst"
  sha256 "4859dce6ce4e16addda962fa65a51aa050d7644e1e74b665d04550fcc1ffc055"
  license "LGPL-2.0-or-later"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
