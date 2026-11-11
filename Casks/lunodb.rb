cask "lunodb" do
  arch arm: "arm64", intel: "x64"

  version "2.3.0"
  sha256 arm:   "b1bf4cbbc0461e99c4aeb4d0b2374725adf9b0818bc7e27667763dccdc95d9e1",
         intel: "3f1a45dc9fc82a7e3597146a1b6288f312df5968d86868cdac130d221237caa2"

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
