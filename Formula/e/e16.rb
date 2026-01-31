class E16 < Formula
  version "1.0.31"
  desc "A window manager for the X11 windowing system"
  homepage "https://www.enlightenment.org/e16"
  url "https://sourceforge.net/projects/enlightenment/files/e16/#{version}/e16-#{version}.tar.gz"
  sha256 "4b2255d43eab66dddd4599096d82948927d28997c0ce445dcc65528f682efe91"
  license "MIT"
  
  resource "ttf-bitstream-vera" do
    version "1.10"
    url "https://download.gnome.org/sources/ttf-bitstream-vera/#{version}/ttf-bitstream-vera-#{version}.tar.gz"
    sha256 "3a84126ce11ef404d1453438e35450b9e0838220d262059e56cd8496ac6f5d15"
  end

  depends_on "pkgconf" => :build
  depends_on "dbus"
  depends_on "freetype"
  depends_on "libsndfile"
  depends_on "libsm"
  depends_on "libx11"
  depends_on "libxcomposite"
  depends_on "libxdamage"
  depends_on "libxft"
  depends_on "libxinerama"
  depends_on "libxrandr"
  depends_on "libxxf86vm"
  depends_on "pulseaudio"
  
  uses_from_macos "curl"

  on_macos do
    depends_on "gettext"
  end

  def install
    system "curl", "-o", "fonts/Vera.ttf", "https://github.com/splitbrain/mtc/raw/refs/heads/master/MTC/fonts/Vera.ttf"
    system "curl", "-o", "fonts/VeraBd.ttf", "https://github.com/splitbrain/mtc/raw/refs/heads/master/MTC/fonts/VeraBd.ttf"
    
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
