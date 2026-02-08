class Fsel < Formula
  version "3.0.0"
  desc "Fast TUI app launcher for GNU/Linux and *BSD"
  homepage "https://github.com/Mjoyufull/fsel"
  url "https://github.com/Mjoyufull/fsel/archive/refs/tags/#{version}.tar.gz"
  sha256 "060474a1d4ce2446c910acffd9d284bac09779851a1597d0c559ac7d2bf860f8"
  license "BSD-2-Clause"

  depends_on "rust" => :build
  depends_on "chafa"

  def install
    system "cargo", "build", "--locked", "--release"
    bin.install "target/release/fsel"
    man1.install "fsel.1"
    doc.install "LICENSE"
    doc.install "README.md"
    doc.install "USAGE.md"
  end

  test do
    system "false"
  end
end
