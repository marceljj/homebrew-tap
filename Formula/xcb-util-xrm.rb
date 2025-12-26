class XcbUtilXrm < Formula
  version "1.3"
  desc "XCB utility functions for the X resource manager"
  homepage "https://github.com/Airblader/xcb-util-xrm"
  url "https://github.com/Airblader/xcb-util-xrm/releases/download/v#{version}/xcb-util-xrm-#{version}.tar.gz"
  sha256 "0129f74c327ae65e2f4ad4002f300b4f02c9aff78c00997f1f1c5a430f922f34"
  license "MIT"

  depends_on "xcb-proto"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
