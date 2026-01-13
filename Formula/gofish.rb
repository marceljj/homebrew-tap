class Gofish < Formula
  version "1.2"
  desc "A lightweight gopher server"
  homepage "https://gofish.sourceforge.net"
  url "https://downloads.sourceforge.net/project/gofish/gofish/#{version}/gofish-#{version}.tar.gz"
  sha256 "1ab8390ec9b3373a298eee564c8b10b3527b22f86f044c9427d32065e9b6252f"
  license "GPL-2.0"

  def install
    inreplace "checkfiles", "/var/gopher", "#{prefix}/var/gopher"
    inreplace "gofish.1", "/etc/gofish.conf", "#{prefix}/etc/gofish.conf"
    
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "gofish", "--help"
  end
end
