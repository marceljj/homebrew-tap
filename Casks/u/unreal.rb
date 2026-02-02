cask "unreal" do
  version "227k_13"
  sha256 "d28b58cf274486d8417828b3d56142c56bdaea870a7c579949b273a60ec608d6"

  url "https://github.com/OldUnreal/Unreal-testing/releases/download/v#{version}/OldUnreal-UnrealPatch227k-macOS.dmg"
  name "Unreal"
  desc "Open-source version of the 1998 game"
  homepage "https://www.oldunreal.com/downloads/unreal"

  app "Unreal.app"
end
