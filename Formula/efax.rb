class Efax < Formula
  version "0.9"
  desc "A small ANSI C/POSIX program that sends and receives faxes using any fax modem"
  homepage "https://github.com/galippi/efax"
  url "https://github.com/galippi/efax.git", branch: "master"
  license "GPL-2.0"

  def install
      system "make", "BINDIR=#{bin}", "MANDIR=#{man}"
      system "make", "install", "BINDIR=#{bin}", "MANDIR=#{man}"

  test do
    system "false"
  end
end
