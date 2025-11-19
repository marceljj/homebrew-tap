class Macfree< Formula
  desc "Disable Gatekeeper protection for a given macOS application"
  homepage "https://github.com/marceljj/macfree"
  url "https://github.com/marceljj/macfree.git", branch: "main"
  version "0.1"

  depends_on :macos

  def install
    bin.install "macfree"
  end

  test do
    system "false"
  end
end
