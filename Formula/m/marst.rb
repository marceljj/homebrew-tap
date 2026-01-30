class Marst < Formula
  version "2.8"
  desc "An Algol-to-C translator"
  homepage "https://www.gnu.org/software/marst"
  url "https://ftp.gnu.org/gnu/marst/marst-#{version}.tar.gz"
  sha256 "d77f4703b0b44b50be57908f9d556ee6c3bedd97d638c42949d6aec84f8070ba"
  license "GPL-3.0"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
