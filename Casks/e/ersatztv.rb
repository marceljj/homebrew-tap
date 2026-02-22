cask "ersatztv" do
  arch arm: "arm64", intel: "x64"
  version "26.2.0"
  sha256 arm: "cfed5664a707a9ac2a8cece03c0e945e476431e13f56e47a4f24947e9f15ff97",
         intel: "660aa5779b3ac1e51fb8e4d52819437a7f0c89c5b12a285eee2483d1dc2aa9d3"
  url "https://github.com/ErsatzTV/ErsatzTV/releases/download/v#{version}/ErsatzTV-v#{version}-osx-#{arch}.dmg"
  name "ErsatzTV"
  desc "Open-source platform that transforms your personal media library into live, custom TV channels"
  homepage "https://ersatztv.org"

  app "ErsatzTV.app"
end
