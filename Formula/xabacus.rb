class Xabacus < Formula
  version "8.9.2"
  desc "An abacus for X11"
  homepage "https://www.sillycycle.com/abacus.html"
  url "https://sillycycle.com/abacus/xabacus-#{version}.tar.xz"
  sha256 "45f092219b006e6a15f93d9d3b585a5dc139ccef8bf590b6de31aab2fba1fb8e"
  license "MIT"

  depends_on "libx11"
  depends_on "libxaw3d"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "PREFIX=#{prefix}", "install"
  end
  
  test do
    system "false"
  end
end
