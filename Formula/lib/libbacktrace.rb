class Libbacktrace < Formula
  version "git-2025.11"
  desc "Stores and recalls filenames using shorter aliases"
  homepage "https://github.com/ianlancetaylor/libbacktrace"
  url "https://github.com/ianlancetaylor/libbacktrace.git", branch: "master"
  license "BSD-3-Clause"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
