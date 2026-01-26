class Uemacs < Formula
  version "4.0.15"
  desc "Linus Torvalds's custom version of MicroEMACS"
  homepage "https://github.com/torvalds/uemacs"
  url "https://github.com/torvalds/uemacs.git", branch: "master"

  depends_on "pkgconf" => :build
  depends_on "hunspell"
  depends_on "ncurses"
  
  def install
    system "make", "BINDIR=#{bin}", "LIBDIR=#{share}"
    bin.install "em"
    share.install "emacs.hlp"
    share.install "emacs.rc"
  end

  test do
    system "false"
  end
end
