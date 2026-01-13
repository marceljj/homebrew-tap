class Gofish < Formula
  version "1.2"
  desc "A lightweight gopher server"
  homepage "https://gofish.sourceforge.net"
  url "https://downloads.sourceforge.net/project/gofish/gofish/#{version}/gofish-#{version}.tar.gz"
  license "GPL-2.0"

  def install
    inreplace "gofish.1", "/etc/gofish.conf", "#{prefix}/etc/gofish.conf"
    
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "gofish", "--help"
  end
end
