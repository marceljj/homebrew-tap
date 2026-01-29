cask "flappybird" do
  version "4.3"
  sha256 "0b4abe8b1c9b73707eee41fed614d7ffe83ff42c3d209d3a5064e311a99bc80b"
  url "https://github.com/brandonplank/flappybird/releases/download/#{version}/flappybird.dmg"
  name "Flappy Bird"
  desc "A 1:1 Flappy Bird Clone written 100% in Swift"
  homepage "https://github.com/brandonplank/flappybird"

  app "Flappy Bird.app"
end
