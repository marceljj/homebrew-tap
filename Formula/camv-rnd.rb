class CamvRnd < Formula
  version "1.1.6"
  desc "A free/open source, small, flexible viewer for PCB-related CAM file formats"
  homepage "http://www.repo.hu/projects/camv-rnd"
  url "http://www.repo.hu/projects/camv-rnd/releases/camv-rnd-#{version}.tar.gz"
  sha256 "da195499d456f8663c50d77cf3d7d0512476c48949a90b486f8df69b8bdce1b6"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  depends_on "librnd"

  def install
    ENV.append "LIBRND_PREFIX", "#{Formula['librnd'].opt_prefix}"
    inreplace "scconfig/configure", "./configure" "./configure --prefix=#{prefix}"
    
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
