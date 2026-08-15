# typed: strict
# frozen_string_literal: true

cask "apple-matting" do
  version "0.1.1"
  sha256 arm:   "e0e0791414ae6076e30b10150013d8ed97ae39e8a2691c43b3d51e1ee248fd30",
         intel: "660ac0b239d5f7d7b5011ad4f11e02e3799f6b3cba4181e6aaf673d556f751b6"

  on_arm do
    url "https://github.com/pangxiaobin/apple-matting/releases/download/v#{version}/apple-matting_#{version}_aarch64.dmg",
        verified: "github.com/pangxiaobin/apple-matting/releases/download/"
  end
  on_intel do
    url "https://github.com/pangxiaobin/apple-matting/releases/download/v#{version}/apple-matting_#{version}_x64.dmg",
        verified: "github.com/pangxiaobin/apple-matting/releases/download/"
  end

  name "Apple Matting"
  desc "AI image matting tool"
  homepage "https://github.com/pangxiaobin/apple-matting"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "apple-matting.app"

  zap trash: [
    "~/Library/Application Support/apple-matting",
    "~/Library/Caches/matting.lingxiangtools.top",
    "~/Library/Preferences/matting.lingxiangtools.top.plist",
    "~/Library/Saved Application State/matting.lingxiangtools.top.savedState",
  ]
end
