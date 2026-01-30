class Tinywm < Formula
  version "2024.04"
  desc "The tinest window manager"
  homepage "http://incise.org/tinywm.html"
  url "https://github.com/mackstann/tinywm.git", branch: "master"
  license :public_domain

  depends_on "libx11"

  def install
    system "make"
    bin.install "tinywm"
  end
  
  test do
    system "false"
  end
end
