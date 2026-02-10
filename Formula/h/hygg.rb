class Hygg < Formula
  version "0.1.19"
  desc "Minimalistic Vim-like TUI document reader"
  homepage "https://github.com/MightyBurger/curveball"
  url "https://github.com/kruseio/hygg/archive/refs/tags/#{version}.tar.gz"
  sha256 "36491747e9d47cf7d24ae0666fd2908535eac437e8223a6bd88465a90e1cf35a"
  license "AGPL-3.0"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--locked", "--release"
    bin.install "target/release/hygg"
    doc.install Dir["docs/*"]
  end

  test do
    system "false"
  end
end
