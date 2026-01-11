class LinksX11 < Formula
  version "2.30"
  desc "Lynx-like WWW browser that supports tables, menus, etc. (with X11 support)"
  homepage "https://links.twibright.com/"
  url "https://links.twibright.com/download/links-#{version}.tar.bz2"
  sha256 "c4631c6b5a11527cdc3cb7872fc23b7f2b25c2b021d596be410dadb40315f166"
  license "GPL-2.0-or-later" => { with: "openvpn-openssl-exception" }

  depends_on "pkgconf" => :build
  depends_on "libx11"
  depends_on "openssl@3"

  uses_from_macos "bzip2"
  uses_from_macos "zlib"
  
  conflicts_with "links", because: "links installs a conflicting 'links' binary"

  def install
    system "./configure", "--mandir=#{man}",
                          "--with-ssl=#{Formula["openssl@3"].opt_prefix}",
                          *std_configure_args
    system "make", "install"
    doc.install Dir["doc/*"]
  end

  test do
    system bin/"links", "-dump", "https://duckduckgo.com"
  end
end
