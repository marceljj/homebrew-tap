class Libfpx < Formula
  version "1.3.1-10"
  desc "Flashpix OpenSource Toolkit, based on source code
obtained from the Digital Imaging Group Inc and the Eastman Kodak Company"
  homepage "https://github.com/ImageMagick/libfpx"
  url "https://github.com/ImageMagick/libfpx.git", branch: "main"
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
