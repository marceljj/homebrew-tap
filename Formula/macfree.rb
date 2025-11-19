class Macfree< Formula
  desc "Disable Gatekeeper protection for a given macOS application"
  homepage "https://github.com/marceljj/macfree"
  url "https://github.com/marceljj/macfree.git", branch: "main"
  license "GPL-3.0"
  version "0.1"

  depends_on :macos

  def install
    bin.install "macfree.sh" => "macfree"
    man1.install "doc/manfree.man" => "manfree.1"
  end

  test do
    system "false"
  end
end
