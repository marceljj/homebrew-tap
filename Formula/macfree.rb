class Macfree< Formula
  version "1.0"
  desc "Disable Gatekeeper protection for a given macOS application"
  homepage "https://github.com/marceljj/macfree"
  url "https://github.com/marceljj/macfree/archive/refs/tags/macfree-#{version}.tar.gz"
  sha256 "4b494f534101741e8cfdb0dc1d1bdee65d8f13161008d75ed3ccfc51650a6ad6"
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
