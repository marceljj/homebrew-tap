cask "dsdmine" do
  version "2.1"
  sha256 "b77c06ebbc8fbb9b5a879752a89596153a99ff61acddc384c97f58fc42f7aea5"

  url "https://github.com/DragonSWDev/dsdmine/releases/download/v2.1/dsdmine-macos-arm64-2.1.zip"
  name "dsdmine"
  desc "Cross platform implementation of Minesweeper-like game"
  homepage "https://github.com/DragonSWDev/dsdmine"
  
  depends_on arch: :arm64

  app "Cantata.app"
  binary "#{appdir}/dsdmine.app/Contents/MacOS/dsdmine"
  binary "#{appdir}/dsdmine.app/Contents/MacOS/dsdmine", target: "minesweeper"
end
