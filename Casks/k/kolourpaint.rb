cask "kolourpaint" do
  arch arm: "arm64", intel: "x86_64"
  version "25.12.2"
  sha256 arm: "c0096385cd22e569a29a02dcfa4929cd8b7c96a555bf62bf77273a1d162eccea",
         intel: "4f0d0101401a01dbf8e400e4bd8184c973dd4f9668caab05cbbcefd4e8275e19"
  url "https://cdn.kde.org/ci-builds/graphics/kolourpaint/master/macos-arm64/kolourpaint-master-1239-macos-clang-#{arch}.dmg"
  name "KolourPaint"
  desc "A simple painting program to quickly create raster images"
  homepage "https://apps.kde.org/kolourpaint"
  
  app "KolourPaint.app"
end
