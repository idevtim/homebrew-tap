cask "lunodb" do
  arch arm: "arm64", intel: "x64"

  version "2.8.1"
  sha256 arm:   "20d454603e7925c8ba7c182cd9a2ae0be332b45adf3fc1c1b1471f1aaacf5cc1",
         intel: "c15171abc0b30ba899ee501bcff63494bb2044fcb097eaa0461130704a7dc5fa"

  url "https://github.com/lunodb/lunodb/releases/download/v#{version}/LunoDB-#{version}-#{arch}.dmg",
      verified: "github.com/lunodb/lunodb/"
  name "LunoDB"
  desc "AI database client for MySQL, PostgreSQL, MongoDB and more"
  homepage "https://lunodb.app/"

  livecheck do
    url "https://github.com/lunodb/lunodb/releases/latest/download/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "LunoDB.app"

  uninstall quit: "com.hardware.lunodb-app"

  # Application Support holds saved connections, query history and AI
  # conversations, so --zap removes those for good.
  zap trash: [
    "~/Library/Application Support/lunodb",
    "~/Library/Caches/com.hardware.lunodb-app",
    "~/Library/Caches/com.hardware.lunodb-app.ShipIt",
    "~/Library/Caches/lunodb-updater",
    "~/Library/HTTPStorages/com.hardware.lunodb-app",
    "~/Library/Logs/lunodb",
    "~/Library/Preferences/com.hardware.lunodb-app.plist",
    "~/Library/Saved Application State/com.hardware.lunodb-app.savedState",
  ]
end
