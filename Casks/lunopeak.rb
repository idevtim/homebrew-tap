cask "lunopeak" do
  version "1.16.0"
  sha256 "c48573fc6a8e248e5420b21799086045291da2617474cd6d31fddfdb8340a529"

  url "https://github.com/idevtim/lunopeak/releases/download/v#{version}/LunoPeak_#{version}_universal.dmg"
  name "LunoPeak"
  desc "Dashboard for Claude Code, Codex and Cursor sessions"
  homepage "https://lunopeak.com/"

  livecheck do
    url "https://github.com/idevtim/lunopeak/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "LunoPeak.app"

  uninstall launchctl: "LunoPeak",
            quit:      [
              "com.lunopeak.app",
              "com.lunopeak.app.menubar",
            ]

  zap trash: [
    "~/Library/Application Support/com.lunopeak.app",
    "~/Library/Caches/com.lunopeak.app",
    "~/Library/Caches/com.lunopeak.app.menubar",
    "~/Library/LaunchAgents/LunoPeak.plist",
    "~/Library/Preferences/com.lunopeak.app.menubar.plist",
    "~/Library/Preferences/com.lunopeak.app.plist",
    "~/Library/WebKit/com.lunopeak.app",
    "~/Library/WebKit/com.lunopeak.app.menubar",
  ]
end
