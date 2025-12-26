class Cwm < Formula
  version "7.4"
  desc "Portable version of OpenBSD's cwm window manager"
  homepage "https://github.com/leahneukirchen/cwm"
  url "https://github.com/leahneukirchen/cwm.git", branch: "linux"
  license "ISC"

  depends_on "libx11"
  depends_on "libxft"
  depends_on "libxrandr"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
