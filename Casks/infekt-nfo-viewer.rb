cask "infekt-nfo-viewer" do
  arch arm: "aarch64", intel: "intel"
  version "2.0.0-alpha1"
  sha256 arm: "06cb4cdaacd5e0784087be3dd6def5552282fdb36d5928639addb535b568c9d0",
         intel: "c0867a52374843cbb34a67fd632881ad60b758262d66be5abb0e86b046c90fee"
  url "https://github.com/syndicodefront/infekt/releases/download/v#{version}/iNFekt-v#{version}-macos-#{arch}.dmg"
  name "iNFekt NFO Viewer"
  desc "The ultimate best NFO viewer, ever"
  homepage "https://infekt.ws"

  app "iNFekt.app"
  binary "#{appdir}/iNFekt.app/Contents/MacOS/infekt-nfo-viewer"
end
