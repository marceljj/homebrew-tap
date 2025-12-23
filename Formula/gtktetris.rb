class Gtktetris < Formula
  version "git-2024.05"
  desc "Simple GTK tetris game"
  homepage "https://github.com/wader/gtktetris"
  url "https://github.com/wader/gtktetris.git", branch: "master"
  license "MIT"

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

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+"].opt_bin/"gtk2-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
