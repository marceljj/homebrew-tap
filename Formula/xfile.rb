class Xfile < Formula
  version "1.0.2"
  desc "A compact file manager for Unix and alike systems running X11"
  homepage "https://fastestcode.org/xfile.html"
  url "https://fastestcode.org/dl/xfile-src-#{version}.tar.xz"
  sha256 "433079deb2eaa1339890a7e2699e9e94df31edcd3600400556e7a57673ddfd77"

  depends_on "libx11"
  depends_on "libxinerama"
  depends_on "libxpm"
  depends_on "libxt"
  depends_on "openmotif"

  def install
    inreplace "mf/Makefile.generic" do |s|
      s.gsub! "PREFIX = /usr", "PREFIX = #{prefix}"
      s.gsub! "-I/usr/local/include", "#{include}"
      s.gsub! "-L/usr/local/lib", "#{lib}"
    end
    
    system "make", "generic"
    system "make", "install"
  end

  test do
    system "false"
  end
end
