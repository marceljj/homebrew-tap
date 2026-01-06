class GnuMiscfiles < Formula
  desc "A collection of files including country codes, airport codes, currency information, and so on"
  version "1.5"
  homepage "https://www.gnu.org/software/inklingreader"
  url "https://ftp.gnu.org/gnu/miscfiles/miscfiles-#{version}.tar.gz"
  sha256 "6aaaa8898b0f6dac18bcaa5492874a6cd1243ffbe7a6dd347ca8f3ec3642a500"
  license "GPL-2.0"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
    doc.install "AUTHORS"
    doc.install "ChangeLog"
    doc.install "COPYING"
    doc.install "dict-README"
    doc.install "GNU-manifesto"
    doc.install "NEWS"
    doc.install "ORIGIN"
    doc.install "README"
    doc.install "TODO"
  end

  test do
    system "none"
  end
end
