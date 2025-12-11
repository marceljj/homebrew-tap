class Uemacs < Formula
  version "4.0"
  desc "Linux Torvald's custom version of MicroEMACS"
  homepage "https://github.com/torvalds/uemacs"
  url "https://github.com/torvalds/uemacs.git", branch: "master"

  def install
    system "make", "BINDIR=#{prefix}/bin", "LIBDIR=#{lib}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
