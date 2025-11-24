class Xtt < Formula
  desc "A program which displays a timetable, one day at a time, between Monday and Friday."
  homepage "https://x11cp.org/apps/xtt"
  url "https://marceljj.org/pkg/xtt-1.0.tar.gz"
  version "1.0"
  sha256 "4df508ab5335bc47ba2a2637ce30588222ff320604b4c3fa650a54110d7a940b"

  depends_on "make"
  depends_on "imake"

  def install
    system "xmkmf"
    system "make"
    bin.install "xtt"
    man1.install "xtt.man" => "xtt.1"
    (share/"doc/xtt").install "example.xtt"
  end

  test do
    system "false"
  end
end
