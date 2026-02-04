cask "banjorecompiled" do
  version "1.0.1"
  sha256 "adc1cd5c86262b3cc932bde8ad33abf1e1efe3d10872670cb0fbe53113cce7da"
  url "https://github.com/BanjoRecomp/BanjoRecomp/releases/download/v1.0.0/BanjoRecompiled-v#{version}-macOS.zip"
  name "BanjoRecompiled"
  desc "PC Port of Banjo-Kazooie made using N64: Recompiled"
  homepage "https://github.com/BanjoRecomp/BanjoRecomp"

  app "BanjoRecompiled.app"
end
