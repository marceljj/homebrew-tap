class Xarclock < Formula
  version "1.0"
  desc "An application which allows for visualising vectors which change over time"
  homepage "https://x11cp.org/apps/xarclock"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "imake" => :build
  depends_on "libx11"
  
  def install
    Dir.chdir("src/xarclock") do
      inreplace "ARClock.c" do |s|
        s.gsub! "static erase_hands(), round();", "int static erase_hands(), round();"
        s.gsub! "register i, j;", "int register i, j;"
        s.gsub! "static erase_hands (w, tm)", "int static erase_hands (w, tm)"
      end
      
      system "xmkmf"
      system "make", "-Wno-deprecated-non-prototype"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
