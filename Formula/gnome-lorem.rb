class GnomeLorem < Formula
  version "1.6"
  desc "Simple app to generate the well-known Lorem Ipsum placeholder text"
  homepage "https://apps.gnome.org/Lorem"
  url "https://gitlab.gnome.org/World/design/lorem/-/archive/#{version}/lorem-#{version}.tar.gz"
  sha256 "7da5ecc08cabf1bd2520bbe06561a886f1b01abe467a7c3e6bc15f79510998c1"
  license "GPL-3.0-or-later"

  depends_on "desktop-file-utils" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "rust" => :build
  depends_on "glib"
  depends_on "gtk4"
  depends_on "libadwaita"

  def install
    ENV["DESTDIR"] = "/"

    inreplace "Cargo.toml", "lorem", "gnome-lorem"
    inreplace "meson.build" do |s|
        s.gsub! "'lorem'", "'gnome-lorem'"
        s.gsub! "application_name = 'Lorem'", "application_name = 'GNOME-Lorem'"
    end
    inreplace "data/org.gnome.design.Lorem.desktop.in.in", "Exec=lorem", "Exec=gnome-lorem"
    
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk4"].opt_bin/"gtk4-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end
  
  def caveats
      <<~EOS
        The binary has been installed as "gnome-lorem" to avoid conflict with the "lorem" package.
      EOS
  end

  test do
    system "false"
  end
end
