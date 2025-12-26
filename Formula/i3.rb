class I3 < Formula
  version "4.25"
  desc "A tiling window manager for X11"
  homepage "https://i3wm.org"
  url "https://i3wm.org/downloads/i3-#{version}.tar.xz"
  sha256 "7eebdef9b14a4f56242764d102c5a30507a97967f1507457e44ec4b775762e42"
  license "BSD-3-Clause"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "libx11"
  depends_on "startup-notification"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "false"
  end
end
