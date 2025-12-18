class AudaciousFull < Formula
  version "4.5.1"
  desc "Lightweight and versatile audio player (full version)"
  homepage "https://audacious-media-player.org"
  url "https://distfiles.audacious-media-player.org/audacious-#{version}.tar.bz2"
  sha256 "7194743a0a41b1d8f582c071488b77f7b917be47ca5e142dd76af5d81d36f9cd"
  license "BSD-2-Clause"
  
  resource "plugins" do
    version "4.5.1"
    url "https://distfiles.audacious-media-player.org/audacious-plugins-#{version}.tar.bz2"
    sha256 "f4feedc32776acfa9d24701d3b794fc97822f76da6991e91e627e70e561fdd3b"
  end

  depends_on "gettext" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "qttools" => :build
  depends_on "dbus"
  depends_on "dbus-glib"
  depends_on "faad2"
  depends_on "ffmpeg"
  depends_on "flac"
  depends_on "fluid-synth"
  depends_on "gdk-pixbuf"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "json-glib"
  depends_on "lame"
  depends_on "libbs2b"
  depends_on "libcue"
  depends_on "libmodplug"
  depends_on "libnotify"
  depends_on "libogg"
  depends_on "libopenmpt"
  depends_on "libsamplerate"
  depends_on "libsidplayfp"
  depends_on "libsndfile"
  depends_on "libsoxr"
  depends_on "libvorbis"
  depends_on "mpg123"
  depends_on "neon"
  depends_on "opusfile"
  depends_on "qtbase"
  depends_on "qtimageformats"
  depends_on "qtmultimedia"
  depends_on "qtsvg"
  depends_on "sdl2"
  depends_on "wavpack"

  uses_from_macos "curl"
  uses_from_macos "zlib"

  on_macos do
    depends_on "gettext"
  end

  on_linux do
    depends_on "alsa-lib"
    depends_on "jack"
    depends_on "libx11"
    depends_on "libxml2"
    depends_on "pulseaudio"
  end

  conflicts_with "audacious", because: "audacious installs a conflicting 'audacious' binary"

  def install
    odie "plugins resource needs to be updated" if build.stable? && version != resource("plugins").version

    args = %w[
      -Dlibarchive=true
      -Dbuildstamp='homebrew build'
    ]

    system "meson", "setup", "build", *args, *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"

    resource("plugins").stage do
      args = %w[
        -Dmac-media-keys=true
      ]

      ENV.prepend_path "PKG_CONFIG_PATH", lib/"pkgconfig"
      system "meson", "setup", "build", *args, *std_meson_args
      system "meson", "compile", "-C", "build", "--verbose"
      system "meson", "install", "-C", "build"
    end
  end

  test do
    system bin/"audacious", "--help"
  end
end
