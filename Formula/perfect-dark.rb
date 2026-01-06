class PerfectDark < Formula
  arch arm: "arm64", intel: "x86_64"
  desc 'A work in progress port of Perfect Dark to modern platforms'
  version "git-2026.01"
  homepage "https://github.com/fgsfdsfgs/perfect_dark"
  url "https://github.com/fgsfdsfgs/perfect_dark.git", branch: "port"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "python@3" => :build
  depends_on "sdl2"
  depends_on "zlib"
  
  def install
    system "cmake", "-S", ".", "-G", "Unix Makefiles", "-DCMAKE_OSX_ARCHITECTURES", "#{arch}", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build", "--target", "pd", "--clean-first"
    bin.install "build/pd.#{arch}" => :build
  end

  test do
    system "none"
  end
end
