class Gmrun < Formula
  version "1.4w"
  desc "A run utiliy featuring a slim design and bash style auto-completion"
  homepage "https://github.com/wdlkmpx/gmrun"
  url "https://github.com/wdlkmpx/gmrun/releases/download/#{version}/gmrun-#{version}.tar.xz"
  sha256 "eaeb68c4ef9da383b0966420fdf1515eb86654673463dfc70124c880dbadf800"
  license "ISC"

  depends_on "pkgconf" => :build
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
