# typed: strict
# frozen_string_literal: true

cask "tine" do
  version "0.6.986"
  sha256 "a8a650365b435e9d87b7ebe3598aa27c9adc4ff684680b17ca30d768d5ee64f8"

  url "https://github.com/martinkoutecky/tine/releases/download/v#{version}/Tine_#{version}_universal.dmg"
  name "Tine"
  desc "Local-first outliner for Logseq-compatible graphs"
  homepage "https://tine.page/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Tine.app"
  binary "#{appdir}/Tine.app/Contents/MacOS/tine"

  zap trash: [
    "~/Library/Application Support/page.tine.Tine",
    "~/Library/Caches/page.tine.Tine",
    "~/Library/Logs/page.tine.Tine",
    "~/Library/Saved Application State/page.tine.Tine.savedState",
    "~/Library/WebKit/page.tine.Tine",
  ]
end
