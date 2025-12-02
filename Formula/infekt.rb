class Infekt < Formula
  version "2.0.0-alpha1"
  desc "The ultimate best NFO viewer, ever"
  homepage "https://infekt.ws"
  url "https://github.com/syndicodefront/infekt/archive/refs/tags/v#{version}.tar.gz"
  sha256 "93f786a2742528618c90ce820949ef101deb8f1778f5d68beb1375aa8bef69e6"
  license "GPL-2.0"

  depends_on "rust"

  def install

    system "cargo", "build", *std_cargo_args
  end

  test do
    system "false"
  end
end
