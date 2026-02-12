class Idevicerestore < Formula
  version "git-2025.11"
  desc "Generate pair records for iOS and save them"
  homepage "https://github.com/libimobiledevice/idevicerestore"
  url "https://github.com/libimobiledevice/idevicerestore.git", branch: "master"
  license "LGPL-3.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on "libimobiledevice"
  depends_on "libimobiledevice-glue"
  depends_on "libirecovery"
  depends_on "libplist"
  depends_on "libtatsu"
  depends_on "libusb"
  depends_on "libzip"
  depends_on "readline"

  def install
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
