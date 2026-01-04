class RouteRnd < Formula
  version "0.9.3"
  desc "A free/open source, flexible, modular autorouter for Printed Circuit Boards"
  homepage "http://www.repo.hu/projects/route-rnd"
  url "http://www.repo.hu/projects/route-rnd/releases/route-rnd-#{version}.tar.gz"
  sha256 "0cba858e5047246d66c70f2c2948cc626def5296c68fab3c8b978aa31159c33b"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  depends_on "librnd"

  def install
    ENV.append "LIBRND_PREFIX", "#{Formula['librnd'].opt_prefix}"
    inreplace "Makefile.conf.in", "/usr/local", "#{prefix}"
    
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
