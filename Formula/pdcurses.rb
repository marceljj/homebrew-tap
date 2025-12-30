class Pdcurses < Formula
  version "3.9"
  desc "A curses library for environments that don't fit the termcap/terminfo model"
  homepage "https://pdcurses.org"
  url "https://github.com/wmcbrine/PDCurses/archive/refs/tags/3.9.tar.gz"
  sha256 "590dbe0f5835f66992df096d3602d0271103f90cf8557a5d124f693c2b40d7ec"
  license :public_domain

  depends_on "libx11"
  depends_on "sdl2"

  def install
    chdir "sdl2"
    system "make"
    lib.install "pdcurses.a"
  end

  test do
    system "false"
  end
end
