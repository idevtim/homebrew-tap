cask "lunodb" do
  arch arm: "arm64", intel: "x64"

  version "2.1.4"
  sha256 arm:   "164b88e673d48792647e8f468bcee9c13aaab7f4e0d3256b3897ecc7af81fda5",
         intel: "aa6930ef9495baa7e70ac105a8208d24ab46bd89ebd22a82ec4e82d9f0558c99"

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
