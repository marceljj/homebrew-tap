class Photoqt < Formula
  desc "QT Image Viewer"
  version "5.1"
  homepage "https://photoqt.org"
  url "https://photoqt.org/downloads/source/photoqt-#{version}.tar.gz"
  sha256 "a2f41c5481c2c3c8f125c38f8142a99d69b21d727be816616b66dd96af9a9c63"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "devil"
  depends_on "exiv2"
  depends_on "freeimage"
  depends_on "imagemagick"
  depends_on "libarchive"
  depends_on "libmpv"
  depends_on "libvips"
  depends_on "pugixml"
  depends_on "qt"
  depends_on "qtimageformats"
  depends_on "qtlocation"
  depends_on "resvg"
  
  def install
    args = %w[
      -DWITH_FREEIMAGE=TRUE
      -DWITH_LIBVIPS=TRUE
      -DWITH_PUGIXML=TRUE
      -DWITH_RESVG=TRUE
    ]
    
    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
