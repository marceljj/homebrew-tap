class Ardour < Formula
  version "git-2025.12"
  desc "A digital audio workstation"
  homepage "https://ardour.org/"
  url "https://github.com/Ardour/ardour.git", branch: "master"
  license "GPL-2.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "aubio"
  depends_on "boost"
  depends_on "fftw"
  depends_on "glib"
  depends_on "glibmm"
  depends_on "jack"
  depends_on "libarchive"
  depends_on "liblo"
  depends_on "libsndfile"
  depends_on "libusb"
  depends_on "lrdf"
  depends_on "lv2"
  depends_on "pangomm"
  depends_on "rubberband"
  depends_on "serd"
  depends_on "sord"
  depends_on "sratom"
  depends_on "gtkmm"
  depends_on "lilv"
  depends_on "taglib"
  depends_on "vamp-plugin-sdk"

  def install
    system "./waf", "configure", "--prefix=#{prefix}", "--with-backends=jack"
    system "./waf", "-v"

    cd "./tools/osx_packaging" do
      system "./osx_build", "--help"
    end
  end

  test do
    system "false"
  end
end
