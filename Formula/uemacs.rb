class Uemacs < Formula
  version "4.0"
  desc "Linus Torvalds's custom version of MicroEMACS"
  homepage "https://github.com/torvalds/uemacs"
  url "https://github.com/torvalds/uemacs.git", branch: "master"

  def install
    system "make", "BINDIR=#{bin}", "LIBDIR=#{share}"
    bin.install "em"
    share.install "emacs.hlp"
    share.install "emacs.rc" => ".emacsrc"
  end

  test do
    system "false"
  end
end
