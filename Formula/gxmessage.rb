class Gxmessage < Formula
  version "3.4.3"
  desc "An xmessage clone for GTK based desktops"
  homepage "https://trmusson.dreamhosters.com/programs.html#gxmessage"
  url "https://trmusson.dreamhosters.com/stuff/gxmessage-#{version}.tar.gz"
  sha256 "db4e1655fc58f31e5770a17dfca4e6c89028ad8b2c8e043febc87a0beedeef05"
  license "GPL-3.0"

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
