class Libdstr < Formula
  version "1.0"
  desc "Dave's string class (std::string replacement)"
  homepage "https://github.com/ianlancetaylor/libbacktrace"
  url "https://flaterco.com/files/libdstr-#{version}.tar.bz2"
  sha256 "cc9c2c7423599897761f931833dfd16aa483b1fec09b99fd588eddb428130e5c"
  license :public_domain
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
