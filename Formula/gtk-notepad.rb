class GtkNotepad < Formula
  version "git-2016.08"
  desc "Basic text editor written in C/GTK"
  homepage "https://github.com/JadedTuna/gtk-notepad"
  url "https://github.com/JadedTuna/gtk-notepad.git", branch: "master"
  license "GPL-2.0"

  depends_on "glib"
  depends_on "gtk+"
  
  def install
    system "make", "all"
    bin.install "gtk-notepad"
    doc.install "LICENSE"
    doc.install "README.md"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+"].opt_bin/"gtk2-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
