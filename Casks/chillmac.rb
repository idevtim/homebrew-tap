cask "chillmac" do
  version "1.10.0"
  sha256 "9f41dde7e9fc3c15fe0b84043f89fde98dd966b024ba4fb26e3684f20e318646"

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
