class Gmrun < Formula
  version "1.4w"
  desc "A run utiliy featuring a slim design and bash style auto-completion"
  homepage "https://github.com/wdlkmpx/gmrun"
  url "https://github.com/wdlkmpx/gmrun/releases/download/#{version}/gmrun-#{version}.tar.xz"
  sha256 "db4e1655fc58f31e5770a17dfca4e6c89028ad8b2c8e043febc87a0beedeef05"
  license "ISC"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+3"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
