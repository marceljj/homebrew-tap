class Epic6 < Formula
  version "0.0.1"
  desc "The sixth generation EPIC IRC client"
  homepage "https://www.epicsol.org"
  url "https://gitview.epicsol.org/epic6.git", branch: "master"
  sha256 "5459871a62a06d2084b39ae2202af67e25a026306a6eeff4797df47d5895ddfd"
  license "BSD-3-Clause"

  depends_on "libarchive"
  depends_on "pcre2"
  depends_on "python@3"
  depends_on "openssl@3"

  uses_from_macos "libxcrypt"
  uses_from_macos "ncurses"

  def install
    args = %w[
      --with-ssl=#{Formula["openssl@3"].opt_prefix}
    ]
    
    system "./configure", "--mandir=#{man}", *args, *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
