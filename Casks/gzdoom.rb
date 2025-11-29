cask "uzdoom" do
  version "4.14.3"
  sha256 "sha256:7fea2eb9de6a4694e56da9f7750f8f002d272891908b730020122b22beb59c0c"

  url "https://github.com/UZDoom/UZDoom/releases/download/#{version}/macOS-UZDoom-#{version}.zip"
  name "UZDoom"
  desc "Adds an OpenGL renderer to the ZDoom source port"
  homepage "https://github.com/UZDoom/UZDoom"

  app "UZDoom.app"
end
