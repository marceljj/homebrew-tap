class Opendoas < Formula
  version "6.8.2"
  desc "A portable fork of the OpenBSD 'doas' command"
  homepage "https://github.com/Duncaen/OpenDoas"
  url "https://github.com/Duncaen/OpenDoas/releases/download/v#{version}/opendoas-#{version}.tar.gz"
  sha256 "28dca29adec5f4336465812d9e2243f599e62a78903de71c24f0cd6fe667edac"
  license "ISC"

  def install
    system "./configure", "--prefix=#{prefix}", "--libdir=#{libdir}"
    system "make"
    system "make", "install"
  end

  def caveats
    <<~EOS
      The 'doas' command will not work without an appropriate 'doas' file in:
        /etc/pam.d/
        
      (/etc/pam.d/sudo is a good starting point for configuration)
    EOS
  end

  test do
    system "false"
  end
end
