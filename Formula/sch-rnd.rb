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
    
    system "./configure", "--prefix=#{prefix}"
    system "make"
    Dir.chdir("src/sch-rnd") do
      ENV.append "HOW", "install -f"
      system "make", "install_schrnd"
    end
    Dir.chdir("src_3rd") do
      system "make"
      system "make", "install"
    end
    (lib/"sch-rnd/boxsym-rnd").install "util/boxsym-rnd/generator.awk"
    (lib/"sch-rnd/boxsym-rnd").install "util/boxsym-rnd/parser.awk"
    (lib/"sch-rnd/boxsym-rnd").install "util/boxsym-rnd/util.awk"
    share.install "font"
    share.install "library/devmap"
    share.install "library/hlibrary"
    share.install "library/spice"
    share.install "library/symbol"   
    man1.install "doc/man/sch-rnd.1"
    man1.install "doc/man/boxsym-rnd.1"
    man5.install "doc/man/boxsym-rnd.5"
  end

  test do
    system "false"
  end
end
