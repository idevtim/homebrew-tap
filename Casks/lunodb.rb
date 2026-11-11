cask "lunodb" do
  arch arm: "arm64", intel: "x64"

  version "2.2.0"
  sha256 arm:   "93aa396701adcae30fca5b301fb392d76a0e502bc8f8de4411d0c4f666cca017",
         intel: "ef6acc9ee1be28978da0cbba3e68ff097228e55c95f3d7d998a56f67416cb1f6"

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
