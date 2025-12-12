class Gnuit < Formula
  version "4.9.5"
  desc "A set of interactive text-mode tools, closely integrated with the shell"
  homepage "https://www.gnu.org/software/gnuit"
  url "https://ftp.gnu.org/gnu/gnuit/gnuit-#{version}.tar.gz"
  license "GPL-3.0"
  sha256 "6b6e96db13bafa5ad35c735b2277699d4244088c709a3e134fb1a3e8c8a8557c"

  depends_on "make"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make install"
  end

  test do
    system "false"
  end
end
