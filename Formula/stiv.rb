class Stiv < Formula
  version "git-2023.01"
  desc "Suckless terminal image viewer"
  homepage "https://github.com/radare/tiv"
  url "https://github.com/radare/tiv.git", branch: "master"
  license "BSD-3-Clause"

  depends_on "vala" => :build
  depends_on "glib"
  depends_on "libjpeg"
  
  def install
    system "make", "PREFIX=#{prefix}"
    bin.install "stiv"
    bin.install "stiv-jpeg"
    bin.install "tiv" => "stiv-vala"
  end

  def caveats
      <<~EOS
        The "tiv" binary has been installed as "stiv-vala" to avoid conflict with the "terminalimageviewer" package.
      EOS
  end

  test do
    system "false"
  end
end
