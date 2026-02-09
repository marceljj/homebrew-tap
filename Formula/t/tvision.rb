class Tvision < Formula
  desc "A modern port of Turbo Vision 2.0"
  version "git-2026.01"
  homepage "https://github.com/magiblot/tvision"
  url "https://github.com/magiblot/tvision.git", branch: "master"
  license "MIT"

  depends_on "cmake" => :build

  uses_from_macos "ncurses"
  
  on_linux do
    depends_on "xclip"
  end
  
  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
