cask "sshfs3" do
  version "3.7.5"
  sha256 "611713612179cf7ccd2995051165da7d19e0ca199ae70d9680c3d3551f456d46"
  url "https://github.com/libfuse/sshfs/releases/download/sshfs-#{version}/sshfs-#{version}.pkg",
      verified: "github.com/libfuse/sshfs"
  name "sshfs"
  desc "A network filesystem client to connect to SSH servers"
  homepage "https://github.com/libfuse/sshfs"

  pkg "sshfs-#{version}.pkg"

  uninstall pkgutil: "io.macfuse.installer.components.sshfs"
end
