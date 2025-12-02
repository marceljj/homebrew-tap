cask "infekt" do
  version "2.0.0-alpha1"
  sha256 "06cb4cdaacd5e0784087be3dd6def5552282fdb36d5928639addb535b568c9d0"

  url "https://github.com/syndicodefront/infekt/releases/download/v#{version}/iNFekt-v#{version}-macos-aarch64.dmg"
  name "Infekt"
  desc "The ultimate best NFO viewer, ever"
  homepage "https://infekt.ws"

  app "iNFekt.app"
end
