cask "lunodb" do
  arch arm: "arm64", intel: "x64"

  version "2.3.0"
  sha256 arm:   "07c910badac067ae172e53156b2ca236a2867724a61d951ea198f89965557cd1",
         intel: "9f24fd2bdd0725d17d1e3516a220c93ce1a7c952616b52efde59dd560200a500"

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
