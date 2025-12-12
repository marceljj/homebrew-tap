class GnuGengen < Formula
  version "git-1.4.3"
  desc "A tool to generate a C++ class (or C functions) for generating text"
  homepage "https://git.savannah.gnu.org/git/gengen"
  url "https://git.savannah.gnu.org/git/gengen.git", branch: "master"
  license "GPL-3.0"

  depends_on "automake"
  depends_on "texinfo"
  
  conflicts_with "halide",
    because: "halide installs a conflicting 'gengen' executable"

  def install
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
