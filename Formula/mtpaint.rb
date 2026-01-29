class Mtpaint < Formula
  version "3.50"
  desc "Mark Tyler's Painting Program"
  homepage "https://mtpaint.sourceforge.net"
  url "https://downloads.sourceforge.net/project/mtpaint/mtpaint/#{version}/mtpaint-#{version}.tar.bz2"
  sha256 "695cea10c428a8f122ed59beee5ffa49dcdcba8d88a4790eaf3c64fd7c73d6ac"
  license "GPL-3.0"

  depends_on "pkgconf" => :build
  depends_on "giflib"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "jpeg-turbo"
  depends_on "libtiff"
  depends_on "openjpeg"
  depends_on "webp"

  def install
    args = %w[
      GIF
      jpeg
      jp2v2
      tiff
      webp
      intl
      man
    ]

    (prefix/"_conf.txt").write <<~EOS
      CC = /usr/bin/gcc -Wall  -Wno-pointer-sign -Wno-int-to-pointer-cast -Wno-string>
      EXEEXT =
      MT_VERSION=mtPaint #{version}
      MT_DATE=2020-12-31
      MT_PREFIX="#{prefix}"
      MT_DATAROOT="#{prefix}/share"
      MT_LANG_DEST="#{prefix}/share/locale"
      MT_MAN_DEST="#{prefix}/share/man"
      LDFLAG =    -lgif -lopenjp2 -lwebp -ltiff -ljpeg -lpng -lz -lm -lintl -L/opt/ho>
      CFLAG =  -DU_GIF -DU_JP2=2 -DU_WEBP -DU_TIFF -DU_JPEG -DU_NLS -DMT_LANG_DEST='">
      subdirs = src po doc
      BIN_INSTALL="#{prefix}/bin"
      SET_RANDSEED = -frandom-seed=$*
    EOS
    system "./configure", *args, *std_configure_args
    system "make"
    system "make", "install"
  end

  def post_install
    system Formula["glib"].opt_bin/"glib-compile-schemas", HOMEBREW_PREFIX/"share/glib-2.0/schemas"
    system Formula["gtk+3"].opt_bin/"gtk3-update-icon-cache", "-qtf", HOMEBREW_PREFIX/"share/icons/hicolor"
  end

  test do
    system "false"
  end
end
