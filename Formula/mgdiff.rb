class Mgdiff < Formula
  version "1.0"
  desc "A graphical frontend to the diff command, written using Motif"
  homepage "https://x11cp.org/apps/mgdiff"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "imake" => :build
  depends_on "openmotif"

  def install
    Dir.chdir("src/mgdiff") do
      system "xmkmf"
      system "make"
      bin.install "mgdiff"
      man1.install "mgdiff.man" => "mgdiff.1"
      (etc/"X11/app-defaults").install "Mgdiff.ad" => "Mgdiff"
    end
  end

  test do
    system "false"
  end
end
