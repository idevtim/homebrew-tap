cask "isleta" do
  version "2.8.0"
  sha256 "15fc5bca0d1c3422e6ff8b0aff7a3f7a9e906ff75a5904192845a223f4704fbb"

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
