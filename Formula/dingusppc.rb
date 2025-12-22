class Dingusppc < Formula
  version "git-2025.12"
  desc "An experimental PowerPC emulator"
  homepage "https://github.com/dingusdev/dingusppc"
  url "https://github.com/dingusdev/dingusppc.git", branch: "master"
  license "GPL-3.0"

  depends_on "cmake" => :build

  def install
    system "cmake, "-S", ".", "-B", "build", "*std_cmake_args
    system "cmake", "--build", "build"
    bin.install "dingusppc"
  end

  test do
    system "false"
  end
end
