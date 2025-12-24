class NeovimGtk < Formula
  version "0.2.0"
  desc "Neovim GUI, in GTK"
  homepage "https://github.com/daa84/neovim-gtk"
  url "https://github.com/daa84/neovim-gtk/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "df4567bc687074e085b16199cd63edd0b19c12a3d66721f8c2c6021e709f3a21"
  license "GPL-3.0"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "glib"
  depends_on "gtk+3"

  def install
    inreplace "Makefile", "PREFIX?=/usr/local", "PREFIX?=#{prefix}"
    
    system "cargo", std_cargo_args
    system "make", "install-resources"
  end

  test do
    system "false"
  end
end
