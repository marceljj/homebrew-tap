class Xmoontool < Formula
  version "3.0.1"
  desc "An application displaying real time information about the moon"
  homepage "https://x11cp.org/apps/xmoontool"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"
  license :public_domain

  depends_on "libx11"
  
  def install
    Dir.chdir("src/xmoontool") do
      inreplace Makefile do |s|
        s.gsub! "-0", "-0 #{include}"
        s.gsub! "-lm", "-lm #{lib}"
        s.gsub! "/usr/X386/bin", "#{bin}"
        s.gsub! "/usr/man/man1", "#{man}/man1"
      
      system "make"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
