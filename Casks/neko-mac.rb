cask "neko-mac" do
  version "1.1"
  sha256 "7fea2eb9de6a4694e56da9f7750f8f002d272891908b730020122b22beb59c0c"
  url "https://github.com/mdonoughe/neko-mac/releases/download/v#{version}/Neko-#{version}.dmg"
  name "Neko"
  desc "Oneko in Cocoa"
  homepage "hhttps://github.com/mdonoughe/neko-mac"

  app "猫.app", target: "Neko.app"
end
