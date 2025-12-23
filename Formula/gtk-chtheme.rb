class GtkChtheme < Formula
  version "0.3.1"
  desc "GTK+ 2.0 theme changer"
  homepage "http://plasmasturm.org/code/gtk-chtheme"
  url "http://plasmasturm.org/code/gtk-chtheme/gtk-chtheme-0.3.1.tar.bz2"
  sha256 "26f4b6dd60c220d20d612ca840b6beb18b59d139078be72c7b1efefc447df844"
  license "GPL-2.0"

  depends_on "glib"
  depends_on "gtk+"
  
  def install
    inreplace "Makefile", "-DGTK_DISABLE_BROKEN -DGTK_DISABLE_DEPRECATED", "-DGTK_DISABLE_BROKEN"
    system "make"
    system "strip", "gtk-chtheme"
    bin.install "gtk-chtheme"
    man1.install "gtk-chtheme.1"
    doc.install "ChangeLog"
    doc.install "COPYING"
  end

  test do
    system "false"
  end
end
