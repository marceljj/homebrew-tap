class Bclock < Formula
  version "1.0"
  desc "A round, analog X11 clock"
  homepage "https://x11cp.org/apps/bclock"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "imake" => :build
  depends_on "libx11"
  
  def install
    Dir.chdir("src/bclock") do
      system "xmkmf"
      system "make"
      bin.install "bclock"
      man1.install "bclock.man" => "bclock.1"
      doc.install "README"
    end
  end

  test do
    system "false"
  end
end
