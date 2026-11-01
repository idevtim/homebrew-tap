cask "sift" do
  version "1.1.0"
  sha256 "f154e1a46685d4f17f7109458ddc8dc109619a153399d2baed5d7a02f436a765"

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
