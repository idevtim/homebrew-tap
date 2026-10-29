cask "isleta" do
  version "2.7.1"
  sha256 "05923e4a8deb33c6b3467a7271f1abd6d52cbc72fba8c95d26b6a1006c41ff80"

  url "https://github.com/idevtim/isleta/releases/download/v#{version}/Isleta-#{version}.zip"
  name "Isleta"
  desc "Interactive notch and Dynamic Island for the menu bar"
  homepage "https://tryisleta.com/"

  livecheck do
    url "https://raw.githubusercontent.com/idevtim/isleta/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Isleta.app"

  uninstall quit: "com.tryisleta.isleta"

  zap trash: [
    "~/Library/Application Support/Isleta",
    "~/Library/Caches/com.tryisleta.isleta",
    "~/Library/HTTPStorages/com.tryisleta.isleta",
    "~/Library/Preferences/com.tryisleta.isleta.plist",
  ]
end
