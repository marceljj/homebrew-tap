cask "sm64coopdx" do
  arch arm: "ARM", intel: "Intel"
  version "1.4.1"
  sha256 arm: "5ae446eb069d903b770ab735db0c60f37cfecca59e4b66a68fc05a5587a2ec6d",
         intel: "b8bad2ddc1f68908010941bc578ffb3db3964a6fbe9e62c8fae54a177f6eb499"
  url "https://github.com/coop-deluxe/sm64coopdx/releases/download/v#{version}/sm64coopdx_macOS_#{arch}.zip"
  name "Super Mario 64 Coop Deluxe"
  desc "An online multiplayer project for the Super Mario 64 PC port "
  homepage "https://sm64coopdx.com"

  app "sm64coopdx.app"
end
