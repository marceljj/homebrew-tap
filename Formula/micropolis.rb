class Micropolis < Formula
  version "git-2018.04"
  desc "Open-source version of SimCity"
  homepage "https://github.com/interkosmos/micropolis"
  url "https://github.com/interkosmos/micropolis.git", branch: "master"
  license "GPL-3.0-or-later"

  depends_on "tcl-tk"
  
  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
