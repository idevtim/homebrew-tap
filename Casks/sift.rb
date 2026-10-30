cask "sift" do
  version "1.0.0"
  sha256 "76c1f53987bc0993df0a489eb40ecd74f0cea9571ed3ac098ea37887b36e619d"

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
