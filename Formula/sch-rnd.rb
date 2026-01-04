class SchRnd < Formula
  version "1.0.10"
  desc "A simple, modular, scriptable schematics editor"
  homepage "http://www.repo.hu/projects/sch-rnd"
  url "http://www.repo.hu/projects/sch-rnd/releases/sch-rnd-#{version}.tar.gz"
  sha256 "40e8503c6f3598c51ebe83e6a9109a8e137d093ebfe144f1c590d1ffa01c44f1"
  license "GPL-2.0"

  depends_on "pkgconf" => :build
  depends_on "glib"
  depends_on "gtk+"
  depends_on "librnd"

  def install
    ENV.append "LIBRND_PREFIX", "#{Formula['librnd'].opt_prefix}"
    ENV.append "ROOT", "./"
    
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install_schrnd", "HOW=\"install -f\""
    man1.install "doc/man/sch-rnd.1"
    man1.install "doc/man/boxsym-rnd.1"
    man5.install "doc/man/boxsym-rnd.5"
  end

  test do
    system "false"
  end
end
