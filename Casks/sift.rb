cask "sift" do
  version "1.2.0"
  sha256 "6b7ae2400e8efc4a34eb2d0dac8d10ce34fcacce0b87b9518a90c6e030277871"

  url "https://github.com/idevtim/sift/releases/download/v#{version}/Sift_#{version}_universal.dmg"
  name "Sift"
  desc "Disk space cleaner that keeps what it removes for 30 days"
  homepage "https://github.com/idevtim/sift"

  livecheck do
    url "https://github.com/idevtim/sift/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "Sift.app"

  uninstall launchctl: "com.sift.app.weekly-check",
            quit:      "com.sift.app"

  # Application Support also holds Restore's 30-day holding area, so --zap
  # clears anything still waiting there for good.
  zap trash: [
    "~/Library/Application Support/com.sift.app",
    "~/Library/Caches/com.sift.app",
    "~/Library/LaunchAgents/com.sift.app.weekly-check.plist",
    "~/Library/Preferences/com.sift.app.plist",
    "~/Library/WebKit/com.sift.app",
  ]
end
