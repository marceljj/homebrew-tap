cask "sm64coopdx" do
  arch arm: "ARM", intel: "Intel"
  version "1.4.1"
  url "https://github.com/coop-deluxe/sm64coopdx/releases/download/v#{version}/sm64coopdx_macOS_#{arch}.zip"
  name "Super Mario 64 Coop Deluxe"
  desc "An online multiplayer project for the Super Mario 64 PC port "
  homepage "https://sm64coopdx.com"

  app "sm64coopdx.app"
end
