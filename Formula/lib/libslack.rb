class Libslack < Formula
  version "0.7.5"
  desc "A UNIX/C library of general utilities for programmers with Slack"
  homepage "https://libslack.org"
  url "https://libslack.org/download/libslack-#{version}.tar.gz"
  sha256 "10561805042cf6c28476af110b886c4b695b4f38a119390acbb63996170b1cac"
  license "GPL-2.0-or-later"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
