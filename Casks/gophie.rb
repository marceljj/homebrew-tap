cask "gophie" do
  version "1.1"
  sha256 "aacc46f89bba85249079db5f947f88212b5daae6185c5928c79ef2abedfe0645"
  url "https://github.com/jankammerath/gophie/releases/download/#{version}/Gophie-#{version}-MacOS.dmg"
  name "Gophie"
  desc "A modern, graphical and cross-platform client for the Gopher protocol"
  homepage "https://gophie.org"

  app "Gophie.app"
  
  caveats do
      requires_rosetta
  end
end
