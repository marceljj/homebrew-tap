class Epic6 < Formula
  version "0.0.1"
  desc "The sixth generation EPIC IRC client"
  homepage "hhttps://www.epicsol.org"
  url "https://gitview.epicsol.org/epic6.git/", branch: "master"
  license "BSD-3-Clause"
  
  depends_on "pcre2"
  depends_on "openssl"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
