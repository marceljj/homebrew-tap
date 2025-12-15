class Fm < Formula
  version "git-2025.05"
  desc "Small, general purpose file manager built with GTK4"
  homepage "https://github.com/euclio/fm"
  url "https://github.com/euclio/fm.git", branch: "master"
  license "MIT"

  depends_on "glib"
  depends_on "gtk4"
  depends_on "gtksourceview5"
  depends_on "libadwaita"
  depends_on "libpanel"
  depends_on "rust"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "false"
  end
end
