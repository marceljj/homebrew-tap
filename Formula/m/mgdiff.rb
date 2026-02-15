class Mgdiff < Formula
  version "1.0"
  desc "A graphical frontend to the diff command, written using Motif"
  homepage "https://x11cp.org/apps/mgdiff"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "imake" => :build
  depends_on "libx11"
  depends_on "openmotif"

  def install
    inreplace "src/mgdiff/mgdiff.man", "MGDIFF 1", "MGDIFF 1x"
    Dir.chdir("src/mgdiff") do
      system "xmkmf"
      system "make"
      bin.install "mgdiff"
      man1.install "mgdiff.man" => "mgdiff.1x"
      (etc/"X11/app-defaults").install "Mgdiff.ad" => "Mgdiff"
    end
  end

  test do
    system "false"
  end
end
