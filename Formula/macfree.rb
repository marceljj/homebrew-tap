class Macfree< Formula
  version "1.0"
  desc "Disable Gatekeeper protection for a given macOS application"
  homepage "https://github.com/marceljj/macfree"
  url "https://github.com/marceljj/macfree/archive/refs/tags/#{version}.tar.gz"
  sha256 "3d0f856fd2e81d42748eac75a8854f5bf9a7f04ce73c6832a3c203d98864a52b"
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
