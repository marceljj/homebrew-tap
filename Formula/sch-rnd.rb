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
    inreplace "doc/man/boxsym-rnd.1", "&lt; \fIinfile.bs\fB &gt;", "\fIinfile.bs\fB;"
    
    system "./configure", "--prefix=#{prefix}"
    system "make"
    Dir.chdir("src/sch-rnd") do
      ENV.append "HOW", "install -f"
      system "make", "install_schrnd"
    end
    Dir.chdir("src_3rd") do
      system "make", "install"
    end
    system "mkdir", "hlibrary"
    system "mkdir", "plugins"
    system "touch", "hlibrary/.foo"
    system "touch", "plugins/.foo"
    (lib/"sch-rnd").install "plugins"
    (lib/"sch-rnd/boxsym-rnd").install "util/boxsym-rnd/generator.awk"
    (lib/"sch-rnd/boxsym-rnd").install "util/boxsym-rnd/parser.awk"
    (lib/"sch-rnd/boxsym-rnd").install "util/boxsym-rnd/util.awk"
    (share/"sch-rnd").install "font"
    (share/"sch-rnd").install "library/devmap"
    (share/"sch-rnd").install "hlibrary"
    (share/"sch-rnd").install "library/spice"
    (share/"sch-rnd").install "library/symbol"
    man1.install "doc/man/sch-rnd.1"
    man1.install "doc/man/boxsym-rnd.1"
    man5.install "doc/man/boxsym-rnd.5"
  end

  test do
    system "false"
  end
end
