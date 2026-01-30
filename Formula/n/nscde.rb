class Nscde < Formula
  version "2.3"
  desc "Modern and functional CDE desktop based on FVWM"
  homepage "https://github.com/NsCDE/NsCDE"
  url "https://github.com/NsCDE/NsCDE/archive/refs/tags/#{version}.tar.gz"
  sha256 "fc4fd5f16b901b865f44b7483fa01a28189b5d5b95766375e026cc317456b297"
  license "GPL-3.0"

  depends_on "fvwm3"
  depends_on "gtk+"
  depends_on "gtk+3"
  depends_on "imagemagick"
  depends_on "ksh93"
  depends_on "libx11"
  depends_on "libxpm"
  depends_on "pyqt@5"
  depends_on "pyqt@6"
  depends_on "qt@5"
  depends_on "qt@6"
  depends_on "rofi"
  depends_on "xclip"
  depends_on "xdpyinfo"
  depends_on "xdotool"
  depends_on "xprop"
  depends_on "xterm"

  on_macos do
    depends_on "gettext"
  end
  
  on_linux do
    depends_on "gkrellm"
  end

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
