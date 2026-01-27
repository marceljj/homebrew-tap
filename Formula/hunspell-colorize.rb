class HunspellColorize < Formula
  version "git-2026.01"
  desc "Wrapper around 'less' to colorize spelling mistakes using Hunspell"
  homepage "https://github.com/torvalds/HunspellColorize"
  url "https://github.com/torvalds/HunspellColorize.git", branch: "main"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "hunspell"
  
  def install
    inreplace "Makefile", "$(HOME)/bin", "#{prefix}/bin"
  end
  
  system "make"
  system "make", "install"

  test do
    system "false"
  end
end
