class Macfree< Formula
  desc "Disable Gatekeeper protection for a given macOS application"
  homepage "https://github.com/marceljj/macfree"
  url "https://github.com/marceljj/macfree.git", branch: "main"
  license "GPL-3.0"
  version "0.1"

  depends_on :macos

  def install
    bin.install "macfree.sh" => "macfree"
    man1.install "macfree.man" => "macfree.1"
    share("doc/macfree").install "README.md"
    share("doc/macfree").install "LICENSE"
  end

  test do
    system "false"
  end
end
