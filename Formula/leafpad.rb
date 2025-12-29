class Leafpad < Formula
  version "git-2025.03"
  desc "GTK+ based simple text editor"
  homepage "https://github.com/tarot231/leafpad"
  url "https://github.com/tarot231/leafpad.git", branch: "main"
  license "GPL-2.0"
  
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "autoreconf", "-fi"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
