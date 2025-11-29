class Udu < Formula
  desc "An extremely fast command-line disk usage analyzer"
  homepage "https://github.com/gnualmalki/udu"
  url "https://github.com/gnualmalki/udu.git", branch: "main"
  license "GPL-3.0"
  version "0.6.6"

  depends_on "llvm"
  depends_on "libomp"
  depends_on "make"

  def install
    args = []
    if OS.mac?
      args += [
        "ac_cv_prog_c_openmp=-Xpreprocessor -fopenmp",
        "ac_cv_prog_cxx_openmp=-Xpreprocessor -fopenmp",
        "LDFLAGS=-lomp",
      ]
    end
    system "gmake"
    bin.install "udu"
    man1.install "udu.1"
    (share/"doc/udu").install "COPYING"
    (share/"doc/udu").install "README.md"
  end

  test do
    system "false"
  end
end
