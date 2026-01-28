class IdevicePair < Formula
  version "0.1.9"
  desc "Generate pair records for iOS and save them"
  homepage "https://github.com/jkcoxson/idevice_pair"
  url "https://github.com/jkcoxson/idevice_pair/archive/refs/tags/v#{version}.tar.gz"
  sha256 "195cdf53a54145a2276617a6775382f652d419040b19925ee9a43116933d3dc9"
  license "MIT"

  depends_on "rust" => :build
  depends_on "libusbmuxd"

  def install
    system "cargo", "build", "--offline", "--release"
    bin.install "target/release/idevice_pair"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
