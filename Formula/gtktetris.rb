class Gtktetris < Formula
  version "git-2024.05"
  desc "Simple GTK tetris game"
  homepage "https://github.com/wader/gtktetris"
  url "https://github.com/wader/gtktetris.git", branch: "master"
  license "MIT"

  depends_on "gtk+"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
