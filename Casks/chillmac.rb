cask "chillmac" do
  version "2.0.4"
  sha256 "fcd996e04b5c9e419fb13aa3d278135d48349797ef35f0a7c09257c1e1f09168"

  url "https://github.com/idevtim/chillmac/releases/download/v#{version}/ChillMac-#{version}.zip"
  name "ChillMac"
  desc "Menu bar system monitor and fan control"
  homepage "https://github.com/idevtim/chillmac"

  livecheck do
    url "https://raw.githubusercontent.com/idevtim/chillmac/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ChillMac.app"

  uninstall launchctl: "com.idevtim.ChillMac.Helper",
            quit:      "com.idevtim.ChillMac"

  zap trash: [
    "~/Library/Application Support/ChillMac",
    "~/Library/Caches/com.idevtim.ChillMac",
    "~/Library/HTTPStorages/com.idevtim.ChillMac",
    "~/Library/Preferences/com.idevtim.ChillMac.plist",
  ]
end
