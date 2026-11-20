cask "lunopeak" do
  version "2.4.0"
  sha256 "d58758bda111b139625f481a3c45de169cf2c6b3f2daef0a4b54dd49d8849c9d"

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
