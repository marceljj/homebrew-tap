class Guitarix < Formula
  version "0.47.0"
  desc "Virtual Guitar Amplifier"
  homepage "https://guitarix.org"
  url "https://github.com/brummer10/guitarix/releases/download/V#{version}/guitarix2-#{version}.tar.xz"
  sha256 "f18abd3bd2cb05960d00f15f36c63f97eb1759f9571977e3e42191ff16b9b467"
  license "GPL-3.0-or-later"

  depends_on "gettext" => :build
  depends_on "intltool" => :build
  depends_on "python" => :build
  depends_on "glib"
  depends_on "jack"
  depends_on "libffi"
  depends_on "libsndfile"
  depends_on "sassc"
  depends_on "zita-convolver"

  def install
    system "./waf", "configure", "--prefix=#{prefix}"
    system "./waf", "build"
    system "./waf", "install"
  end
  
  test do
    system "false"
  end
end
