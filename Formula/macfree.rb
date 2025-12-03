class Macfree< Formula
  version "1.0"
  desc "Disable Gatekeeper protection for a given macOS application"
  homepage "https://github.com/marceljj/macfree"
  url "https://github.com/marceljj/macfree/archive/refs/tags/macfree-#{version}.tar.gz"
  sha256 "e785a63fb794bd164cc2fc530036105334d333523c4981a54602a3bd07b10e06"
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
