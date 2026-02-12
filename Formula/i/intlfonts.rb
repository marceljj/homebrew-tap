class Intlfonts < Formula
  version "1.4.2"
  desc "GNU International Fonts for Emacs"
  homepage "https://ftp.gnu.org/gnu/intlfonts"
  url "https://ftp.gnu.org/gnu/intlfonts/intlfonts-#{version}.tar.gz"
  license "GPL-3.0-or-later"
  sha256 "cd3b3f186a1468de04593ca61a85d6f07782dcde87e1fd3ac1e31b4ce6f32b9d"

  depends_on "mkfontscale" => :build
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
