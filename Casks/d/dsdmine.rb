cask "dsdmine" do
  version "2.1"
  sha256 "ed09b29b8c478d7c23eb5f1c266cf1819b465edfe38104dff9a85aab2c6d089c"

  url "https://github.com/DragonSWDev/dsdmine/releases/download/v2.1/dsdmine-macos-arm64-2.1.zip"
  name "dsdmine"
  desc "Cross platform implementation of Minesweeper-like game"
  homepage "https://github.com/DragonSWDev/dsdmine"
  
  depends_on arch: :arm64

  app "dsdmine.app"
end
