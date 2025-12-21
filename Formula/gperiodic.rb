class Gperiodic < Formula
  version "1.0"
  desc "A periodic table application"
  homepage "https://github.com/zploskey/gperiodic"
  url "https://github.com/zploskey/gperiodic.git", branch: "master"
  license "GPL-2.0"

  depends_on "intltool" => :build
  depends_on "gtk+"

  def install
      system "make", "BINDIR=#{bin}", "DATADIR=#{share}", "MANDIR=#{man}", "ICONSDIR=#{share}/icons"
      system "make", "install"
  end

  test do
    system "false"
  end
end
