class Xdotclock < Formula
  version "0.1.0"
  desc "A simple digital clock for X Windows"
  homepage "https://x11cp.org/apps/xdotclock"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license "GPL-2.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libx11"
  
  def install
    Dir.chdir("src/xdotclock") do
      system "autoreconf", "-fi"
      system "autoupdate"
      system "./configure", *std_configure_args
      system "make"
      bin.install "xdotclock"
      man1.install "xdotclock.1"
      doc.install "COPYING"
      doc.install "README"
      doc.install "TODO"
    end
  end

  test do
    system "false"
  end
end
