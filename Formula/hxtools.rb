class Hxtools < Formula
  version "20251011"
  desc "A collection of tools and scripts that have accumulated over the years, and each of which seems to be too small to warrants its own project"
  homepage "https://inai.de/projects/hxtools"
  url "https://codeberg.org/jengelh/hxtools/releases/download/rel-#{version}/hxtools-#{version}.tar.zst"
  sha256 "8877d62ad9a85d5b7968fe862065f98da17209394a8df520ae583876d46f3d9b"
  license all_of: ["BSD-2-Clause-Patent", "GPL-2.0-or-later", "MIT"]

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libhx"
  depends_on "libxcb"

  def install
    on_macos do
      inreplace "Makefile.am" do |s|
        s.gsub! "smm/bsvplay smm/hcdplay", "smm/bsvplay"
        s.gsub! "smm_hcdplay_LDADD = ${libHX_LIBS}", "\"
        s.gsub! "doc/hcdplay.1 doc/hxtools.7", "doc/hxtools.7"
      end
    end
    
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  def caveats
    <<~EOS
      The 'hcdplay' binary is not installed on macOS as it is not supported
    EOS
  end

  test do
    system "false"
  end
end
