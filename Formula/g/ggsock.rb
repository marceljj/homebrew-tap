class Ggsock < Formula
  desc "Non-blocking sockets wrapper"
  version "git-2025.08"
  homepage "https://github.com/ggerganov/ggsock"
  url "https://github.com/ggerganov/ggsock.git", branch: "master"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  
  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
