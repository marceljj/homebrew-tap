class GnomeLorem < Formula
  version "git-2025.05"
  desc "Small, general purpose file manager built with GTK4"
  homepage "https://github.com/euclio/fm"
  url "https://github.com/euclio/fm.git", branch: "master"
  license "GPL-3.0-or-later"

  depends_on "rust"

  def install
    system "cargo", "install", "--release", *std_cargo_args

  end

  test do
    system "false"
  end
end
