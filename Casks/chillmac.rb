cask "chillmac" do
  version "2.0.5"
  sha256 "726fd48ff05483dc1fdc536306ceb30a4f7a46101c1c16a2cdcc2b46aa0ef5ae"

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
