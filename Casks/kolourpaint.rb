cask "kolourpaint" do
  arch arm: "arm64", intel: "x86_64"
  version "1236"
  sha256 arm:   "aa71b70f271cd1c5d62e34cf195fdfbcb230639421b45385b7560fbf0e3f6afc",
         intel: "e6eef254d0832f34111e90a42e451af903ff77ab1e395848bb437dd486d0cf0b"
  url "https://cdn.kde.org/ci-builds/graphics/kolourpaint/master/macos-arm64/kolourpaint-master-#{version}-macos-clang-#{arch}.dmg",
  name "KolourPaint"
  desc "A simple painting program to quickly create raster images"
  homepage "https://apps.kde.org/kolourpaint"
  
  app "KolourPaint.app"
end
