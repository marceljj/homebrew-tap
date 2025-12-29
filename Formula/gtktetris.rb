class Gtktetris < Formula
  version "git-2024.05"
  desc "Simple GTK tetris game"
  homepage "https://github.com/wader/gtktetris"
  url "https://github.com/wader/gtktetris.git", branch: "master"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
    doc.install "AUTHORS"
    doc.install "ChangeLog"
    doc.install "LICENSE"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
