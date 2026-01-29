class Evisum < Formula
  version "0.6.4"
  desc "A powerful, efficient, and feature-rich process and system monitor"
  homepage "https://git.enlightenment.org/enlightenment/evisum"
  url "https://download.enlightenment.org/rel/apps/evisum/evisum-#{version}.tar.xz"
  sha256 "865ca8b565137c32a412302f0eb944ef1604306ed792c0a0dd7f5792c75c6bf8"
  license "ISC"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "efl"
  
  on_macos do
    depends_on "gettext"
  end

  def install
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "false"
  end
end
