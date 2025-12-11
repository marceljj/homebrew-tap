class Macfree< Formula
  version "1.1"
  desc "Disable Gatekeeper protection for a given macOS application"
  homepage "https://github.com/marceljj/macfree"
  url "https://github.com/marceljj/macfree/archive/refs/tags/macfree-#{version}.tar.gz"
  sha256 "85f0949725c50eae9e78144fb96c6d3b393b5c35baa800dddecaf134dc45547c"
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
