cask "macprogramguide" do
  version "1.4.4"
  sha256 "1ed2fefdf1f2006be0d5ff716138fdddee4c85a89d3f1e16cf0e6b389c8b3be3"
  url "https://coolmacsoftware.com/bin/MacProgramGuide#{version}.zip"
  name "MacProgramGuide"
  desc "Frontend for SchedulesDirect"
  homepage "https://coolmacsoftware.com/mpgmain.html"

  app "MacProgramGuide.app"
end
