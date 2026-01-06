class Libxaw3dxft < Formula
  version "1.6.4"
  desc "XPaint version of libxaw3d library"
  homepage "https://t2linux.com/packages/libxaw3dxft"
  url "https://github.com/DaveFlater/libXaw3dXft/releases/download/v1.6.4/libxaw3dxft-1.6.4.tar.xz"
  sha256 "283d2d1c9332ae2c51b54228eb82b89737b1c94d9cf5d0bd15cc26863a5feff6"
  license "MIT"

  depends_on "automake" => :build
  depends_on "pkgconf" => :build
  depends_on "libx11"
  
  def install
    system "autoreconf", "-fi"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
