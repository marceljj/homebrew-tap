class Tvision < Formula
  desc "A modern port of Turbo Vision 2.0"
  version "git-2026.01"
  homepage "https://github.com/magiblot/tvision"
  url "https://github.com/magiblot/tvision.git", branch: "master"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ncurses"
  
  on_linux do
    depends_on "xclip"
  end
  
  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    bin.install "build/hello" => "tvhello"
    bin.install "build/mmenu"
    bin.install "build/palette"
    bin.install "build/tvdir"
    bin.install "build/tvforms"
    doc.install "COPYRIGHT"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
