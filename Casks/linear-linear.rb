cask "linear-linear" do
  arch arm: "arm64", intel: "x64"

  version "1.18.3,230531mml1c0i91"
  sha256 :no_check

  url "https://desktop.linear.app/mac/dmg/#{arch}"
  name "Linear"
  desc "App to manage software development and track bugs"
  homepage "https://linear.app/"

  livecheck do
    url :url
    regex(/Linear[\s._-]?v?(\d+(?:\.\d+)+)[\s._-]*Build[\s._-]*([^-\s]+)[._-]#{arch}\.dmg/i)
    strategy :header_match do |headers|
      match = headers["content-disposition"].match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true

  app "Linear.app"

  zap trash: [
    "~/Library/Application Support/Linear",
    "~/Library/Caches/com.linear",
    "~/Library/Caches/com.linear.ShipIt",
    "~/Library/Preferences/com.linear.plist",
    "~/Library/Saved Application State/com.linear.savedState",
  ]
end
