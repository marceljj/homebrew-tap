class Hxtools < Formula
  version "20251011"
  desc "A collection of tools and scripts that have accumulated over the years, and each of which seems to be too small to warrants its own project"
  homepage "https://inai.de/projects/hxtools"
  url "https://codeberg.org/jengelh/hxtools/releases/download/rel-#{version}/hxtools-#{version}.tar.zst"
  sha256 "8877d62ad9a85d5b7968fe862065f98da17209394a8df520ae583876d46f3d9b"
  license all_of: ["BSD-2-Clause-Patent", "GPL-2.0-or-later", "MIT"]

  depends_on "libhx"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
