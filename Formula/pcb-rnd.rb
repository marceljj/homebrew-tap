class PcbRnd < Formula
  version "3.1.7b"
  desc "A free/open source, flexible, modular Printed Circuit Board editor"
  homepage "http://repo.hu/projects/pcb-rnd"
  url "http://repo.hu/projects/pcb-rnd/releases/pcb-rnd-#{version}.tar.gz"
  sha256 "54e74f71ae6c3f87a4b44feed6874d3996a2f6853423b139dcd6d05138505ab6"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  depends_on "librnd"

  def install
    ENV.APPEND "LIBRND_PREFIX", "#{Formula['llvm]].opt_prefix}"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
