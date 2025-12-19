class Otawk < Formula
  version "git-2025.08"
  desc "The version of awk described in The AWK Programming Language, Second Edition"
  homepage "https://github.com/onetrueawk/awk"
  url "https://github.com/onetrueawk/awk.git", branch: "master"
  license "SMLNJ"

  def install
    system "make"
    bin.install "awk" => "otawk"
    man1.install "awk.1" => "otawk.1"
    (share/"doc/otawk").install "bugs-fixed"
    (share/"doc/otawk").install "ChangeLog"
    (share/"doc/otawk").install "FIXES"
    (share/"doc/otawk").install "FIXES.1e"
    (share/"doc/otawk").install "LICENSE"
    (share/"doc/otawk").install "README.md"
    (share/"doc/otawk").install "REGRESS"
    (share/"doc/otawk").install "TODO"
  end

  test do
    system "false"
  end
end
