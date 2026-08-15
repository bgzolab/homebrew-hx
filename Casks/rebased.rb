# typed: strict
# frozen_string_literal: true

cask "rebased" do
  version "1.1.13"
  sha256 arm:   "788e7029e5a8b58cb419adcd24653bdffd72a126775c337929944a365ca150c5",
         intel: "97792938463b3270d2fecacd87280d37cfa97ce4e931aaf5fe74b9264f60afdf"

  on_arm do
    url "https://github.com/DetachHead/rebased/releases/download/#{version}/rebased-aarch64.dmg",
        verified: "github.com/DetachHead/rebased/releases/download/"
  end
  on_intel do
    url "https://github.com/DetachHead/rebased/releases/download/#{version}/rebased.dmg",
        verified: "github.com/DetachHead/rebased/releases/download/"
  end

  name "Rebased"
  desc "IntelliJ-based IDE for the Rust programming language"
  homepage "https://github.com/DetachHead/rebased"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Rebased.app"

  zap trash: [
    "~/Library/Application Support/Rebased",
    "~/Library/Caches/io.github.detachhead.rebased",
    "~/Library/Preferences/io.github.detachhead.rebased.plist",
    "~/Library/Saved Application State/io.github.detachhead.rebased.savedState",
  ]
end
