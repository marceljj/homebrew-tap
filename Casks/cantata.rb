cask "cantata" do
  version "3.4.0"
  sha256 "b77c06ebbc8fbb9b5a879752a89596153a99ff61acddc384c97f58fc42f7aea5"

  url "https://github.com/nullobsi/cantata/releases/download/v#{version}/Cantata-v#{version}-Universal-Darwin.dmg"
  name "Cantata"
  desc "Qt Graphical MPD Client"
  homepage "https://github.com/nullobsi/cantata"

  app "Cantata.app"
  binary "#{appdir}/Cantata.app/Contents/MacOS/Cantata", target: "cantata"
  binary "#{appdir}/Cantata.app/Contents/Resources/scripts/cantata-dynamic"
end
