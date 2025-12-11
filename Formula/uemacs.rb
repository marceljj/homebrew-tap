class Uemacs < Formula
  version "4.0"
  desc "Linux Torvald's custom version of MicroEMACS"
  homepage "https://github.com/torvalds/uemacs"
  url "https://github.com/torvalds/uemacs.git", branch: "master"

  def install
    system "make", "BINDIR=#{prefix}/bin", "LIBDIR=#{lib}"
    bin.install "em"
    lib.install "emacs.hlp"
    lib.install "emacs.rc" => ".emacsrc"
  end

  test do
    system "false"
  end
end
