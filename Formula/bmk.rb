class Gxmessage < Formula
  version "1.3"
  desc "Stores and recalls filenames using shorter aliases"
  homepage "https://trmusson.dreamhosters.com/programs.html#bmk"
  url "https://trmusson.dreamhosters.com/stuff/bmk-#{version}.tar.gz"
  sha256 "ba4424ae2f79f5ac9b215946cce5f8a6aa6b472d456cc38523cf275ba18bd093"
  license "GPL-3.0"
  
  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
