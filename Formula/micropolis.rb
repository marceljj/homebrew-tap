class Micropolis < Formula
  version "git-2025.07"
  desc "Open-source version of SimCity"
  homepage "https://git.zerfleddert.de/cgi-bin/gitweb.cgi/micropolis"
  url "https://gitlab.com/stargo/micropolis.git", branch: "master"
  license "GPL-3.0-or-later"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
