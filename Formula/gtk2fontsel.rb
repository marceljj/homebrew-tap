class Gtk2fontsel < Formula
  version "0.1"
  desc "A font selection program for X11 using the GTK2 toolkit"
  homepage "https://sourceforge.net/projects/gtk2fontsel"
  url "https://downloads.sourceforge.net/project/gtk2fontsel/gtk2fontsel/0.1/gtk2fontsel-0.1.tar.gz"
  sha256 "5cd6396fc3c6e7f9bc358cc5ad30592ba446cdb0138a811216497b6453905a68"
  license "GPL-2.0"

  depends_on "glib"
  depends_on "gtk+"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
    doc.install "AUTHORS"
    doc.install "COPYING"
    doc.install "NEWS"
    doc.install "README"
  end

  test do
    system "false"
  end
end
