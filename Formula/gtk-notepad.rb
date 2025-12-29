class GtkNotepad < Formula
  version "git-2016.08"
  desc "Basic text editor written in C/GTK"
  homepage "https://github.com/JadedTuna/gtk-notepad"
  url "https://github.com/JadedTuna/gtk-notepad.git", branch: "master"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  
  def install
    system "make", "all"
    bin.install "gtk-notepad"
    doc.install "LICENSE"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
