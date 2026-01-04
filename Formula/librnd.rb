class Librnd < Formula
  version "4.4.0"
  desc "A free/open source, flexible, modular two-dimensional CAD engine"
  homepage "http://www.repo.hu/projects/librnd"
  url "http://www.repo.hu/projects/librnd/releases/librnd-#{version}.tar.gz"
  sha256 "8aa93692619fe8442b5f1efe680e4d0419972e660025ba55d9ce84c792b48672"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  depends_on "libgd"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
