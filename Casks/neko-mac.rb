cask "neko-mac" do
  version "1.1"
  sha256 "ed3a93bb988754bc7a5f6af49e5af0b935d6f80190fa2ab1148d7abb9a5f1fd6"
  url "https://github.com/mdonoughe/neko-mac/releases/download/v#{version}/Neko-#{version}.dmg"
  name "Neko"
  desc "Oneko in Cocoa"
  homepage "hhttps://github.com/mdonoughe/neko-mac"

  app "猫.app", target: "Neko.app"
end
