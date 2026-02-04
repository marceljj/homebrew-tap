class Birthday < Formula
  version "1.6.2"
  desc "Posit arithmetic C99 implementation"
  homepage "https://sourceforge.net/projects/birthday"
  url "https://downloads.sourceforge.net/project/birthday/birthday/#{version}/birthday-#{version}.tar.bz2"
  sha256 "355ad07ad3312d8f5c5b54c71596ac3a0e706c539167900d73cb65df30c8e2f4"
  license "GPL-2.0-or-later"

  def install
    system "make"
    bin.install "birthday"
    man1.install "birthday.man" => "birthday.1"
    doc.install "COPYING"
    doc.install "README"
  end

  test do
    system "false"
  end
end
