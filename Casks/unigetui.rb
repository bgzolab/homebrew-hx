# typed: strict
# frozen_string_literal: true

cask "unigetui" do
  version "2026.2.7"
  sha256 arm:   "387fc8082853d68987bdbdce591a7e6755ad0ad6e6480822d0c4f4145a045361",
         intel: "071de32fbcc3485dd99fafd95848286469a1b8fae7b722a521d8e87d1b724fd0"

  on_arm do
    url "https://github.com/Devolutions/UniGetUI/releases/download/v#{version}/UniGetUI.macos-arm64.dmg",
        verified: "github.com/Devolutions/UniGetUI/releases/download/"
  end
  on_intel do
    url "https://github.com/Devolutions/UniGetUI/releases/download/v#{version}/UniGetUI.macos-x64.dmg",
        verified: "github.com/Devolutions/UniGetUI/releases/download/"
  end

  name "UniGetUI"
  desc "Graphical interface for your package managers"
  homepage "https://devolutions.net/unigetui/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "UniGetUI.app"

  zap trash: [
    "~/Library/Application Support/UniGetUI",
    "~/Library/Caches/io.github.marticliment.unigetui",
    "~/Library/Preferences/io.github.marticliment.unigetui.plist",
    "~/Library/Saved Application State/io.github.marticliment.unigetui.savedState",
  ]
end
