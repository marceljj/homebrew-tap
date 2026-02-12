class Idevicerestore < Formula
  version "1.0.0"
  desc "Generate pair records for iOS and save them"
  homepage "https://github.com/libimobiledevice/idevicerestore"
  url "https://github.com/libimobiledevice/idevicerestore/releases/download/1.0.0/idevicerestore-#{version}.tar.bz2"
  sha256 "32712e86315397fd2e8999e77a2d2f790c67f6b4aa50d4d1c64cb2c4609836f7"
  license "LGPL-3.0"

  depends_on "pkgconf" => :build
  depends_on "libimobiledevice"
  depends_on "libirecovery"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
