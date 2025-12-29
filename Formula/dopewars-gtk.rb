class DopewarsGtk < Formula
  desc 'Free rewrite of a game originally based on "Drug Wars" (with GTK support)'
  version "1.6.2"
  homepage "https://dopewars.sourceforge.io"
  url "https://downloads.sourceforge.net/project/dopewars/dopewars/#{version}/dopewars-#{version}.tar.gz"
  sha256 "623b9d1d4d576f8b1155150975308861c4ec23a78f9cc2b24913b022764eaae1"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"

  uses_from_macos "curl"
  uses_from_macos "ncurses"

  on_macos do
    depends_on "gettext"
  end

  conflicts_with "dopewars",
  because: "both packages install the same files"

  def install
    inreplace "src/Makefile.in", "$(dopewars_DEPENDENCIES)", ""
    inreplace "src/Makefile.in", "chmod", "true"
    inreplace "auxbuild/ltmain.sh", "need_relink=yes", "need_relink=no"
    inreplace "src/plugins/Makefile.in", "LIBADD =", "LIBADD = -module -avoid-version"

    system "./configure", "--enable-networking",
                          "--enable-plugins",
                          "--mandir=#{man}",
                          *std_configure_args
    system "make", "install", "chgrp=true"
  end

  test do
    system bin/"dopewars", "-v"
  end
end
