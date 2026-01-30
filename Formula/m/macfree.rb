class Macfree < Formula
  version "1.1"
  desc "Disable Gatekeeper protection for a given macOS application"
  homepage "https://github.com/marceljj/macfree"
  url "https://github.com/marceljj/macfree/archive/refs/tags/macfree-#{version}.tar.gz"
  sha256 "f804bc3a58d795a3a599734e0600567b546451026f19f7617e06c9b52834c554"
  license "GPL-3.0"

  depends_on :macos

  def install
    bin.install "macfree.sh" => "macfree"
    man1.install "docs/macfree.man" => "macfree.1"
    (share/"doc/macfree").install "README.md"
    (share/"doc/macfree").install "LICENSE"
  end

  test do
    system "false"
  end
end
