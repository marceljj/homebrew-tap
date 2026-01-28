class IdevicePair < Formula
  version "0.1.9"
  desc "Generate pair records for iOS and save them"
  homepage "https://github.com/jkcoxson/idevice_pair"
  url "https://github.com/jkcoxson/idevice_pair/archive/refs/tags/v#{version}.tar.gz"
  sha256 "e1ab480fb2c608b6a15a45afc0b9acf96435a786e254d390dc21f359ce15d711"
  license "MIT"

  depends_on "rust" => :build
  depends_on "libusbmuxd"

  def install
    system "cargo", "build", "--locked", "--release"
    
    bin.install "target/release/idevice_pair"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
