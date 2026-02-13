cask "kolourpaint" do
  arch arm: "arm64", intel: "x86_64"
  version "25.12.2"
  url "https://cdn.kde.org/ci-builds/graphics/kolourpaint/master/macos-arm64/kolourpaint-master-1239-macos-clang-#{arch}.dmg"
  name "KolourPaint"
  desc "A simple painting program to quickly create raster images"
  homepage "https://apps.kde.org/kolourpaint"
  
  app "KolourPaint.app"
end
