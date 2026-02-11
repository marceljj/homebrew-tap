class Libslack < Formula
  version "0.7.5"
  desc "A UNIX/C library of general utilities for programmers with Slack"
  homepage "https://libslack.org"
  url "https://libslack.org/download/libslack-#{version}.tar.gz"
  sha256 "10561805042cf6c28476af110b886c4b695b4f38a119390acbb63996170b1cac"
  license "GPL-2.0-or-later"

  depends_on "wget"

  def install
    inreplace "libslack-config.pod" do |s|
      s.gsub! "Uninstall libslack", "Uninstall libslack (disabled)"
      s.gsub! "Uninstall I<libslack>.", "Uninstall I<libslack>. Disabled - use your package manager to uninstall."
    end
    inreplace "libslack-config.t" do |s|
      s.gsub! "Uninstall libslack", "Uninstall libslack (disabled)"
      s.gsub! "-u|--uninstall|uninstall) uninstall;;", "-u|--uninstall|uninstall) echo 'Disabled: use package manager to uninstall';;"
    end
    
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "libslack-config", "-v"
  end
end
