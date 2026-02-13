cask "infekt" do
  arch arm: "aarch64", intel: "intel"
  version "2.0.0-alpha1"
  url "https://github.com/syndicodefront/infekt/releases/download/v#{version}/iNFekt-v#{version}-macos-#{arch}.dmg"
  name "iNFekt NFO Viewer"
  desc "The ultimate best NFO viewer, ever"
  homepage "https://infekt.ws"

  app "iNFekt.app"
  binary "#{appdir}/iNFekt.app/Contents/MacOS/infekt-nfo-viewer"
end
