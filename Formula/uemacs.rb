class Uemacs < Formula
  version "4.0"
  desc "Linux Torvald's custom version of MicroEMACS"
  homepage "https://github.com/torvalds/uemacs"
  url "https://github.com/torvalds/uemacs.git", branch: "master"

  def install
    system "mkdir -p", "#{prefix}/bin"
    system "mkdir -p", "#{prefix}/lib"
    system "make", "BINDIR=#{prefix}/bin", "LIBDIR=#{prefix}/lib"
    system "make", "BINDIR=#{prefix}/bin", "LIBDIR=#{prefix}/lib", "install"
  end

  test do
    system "false"
  end
end
