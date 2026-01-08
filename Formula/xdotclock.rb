class Xdotclock < Formula
  version "0.1.0"
  desc "A dot-based digital clock"
  homepage "https://x11cp.org/apps/xinvest"
  url "https://codeberg.org/x11cp/x11cp.git", branch: "main"

  def install
    Dir.chdir("src/xdotclock") do
      system "./configure", *std_configure_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
