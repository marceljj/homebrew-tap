class Curveball < Formula
  version "1.0.0"
  desc "Curve generator for Neverball"
  homepage "https://github.com/MightyBurger/curveball"
  url "https://github.com/MightyBurger/curveball/archive/refs/tags/v#{version}.tar.gz"
  sha256 "3ad3bb84043f360efe9ae4fa9e4d62f8fb257ae98fd239af1aac8c5433501980"
  license all_of: ["Apache-2.0", "MIT"]

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--locked", "--release"
    bin.install "target/release/curveball"
    doc.install "doc/legal"
  end

  test do
    system "false"
  end
end
