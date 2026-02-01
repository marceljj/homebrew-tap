cask "bubblemon" do
  version "0.11.0"
  sha256 "7eafc5efe620345260d06354e09e951deda2201ced7a0a42e5a8090632200196"
  url "https://github.com/walles/bubblemon/releases/download/osx-#{version}/Bubblemon-Dockapp-#{version}.dmg"
  name "Bubblemon"
  desc "Library + macOS app for showing system load"
  homepage "http://walles.github.io/bubblemon"

  app "Bubblemon.app"
  
  caveats do
      requires_rosetta
  end
end
