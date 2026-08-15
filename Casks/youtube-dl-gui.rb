# typed: strict
# frozen_string_literal: true

cask "youtube-dl-gui" do
  version "3.2.1"
  sha256 arm:   "865e22e21c432bb779f547dd42a70815324745299059e7188b6d82f64eca4b15",
         intel: "1b202fe7123aa8408265c1ba795b734019feacbf179de081f9ca154b02ec37d1"

  on_arm do
    url "https://github.com/jely2002/youtube-dl-gui/releases/download/app-v#{version}/Open.Video.Downloader_#{version}_aarch64.dmg",
        verified: "github.com/jely2002/youtube-dl-gui/releases/download/"
  end
  on_intel do
    url "https://github.com/jely2002/youtube-dl-gui/releases/download/app-v#{version}/Open.Video.Downloader_#{version}_x64.dmg",
        verified: "github.com/jely2002/youtube-dl-gui/releases/download/"
  end

  name "Open Video Downloader"
  name "youtube-dl-gui"
  desc "Cross-platform GUI for downloading videos"
  homepage "https://github.com/jely2002/youtube-dl-gui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Open Video Downloader.app"

  zap trash: [
    "~/Library/Application Support/Open Video Downloader",
    "~/Library/Caches/com.jelleglebbeek.youtube-dl-gui",
    "~/Library/Preferences/com.jelleglebbeek.youtube-dl-gui.plist",
    "~/Library/Saved Application State/com.jelleglebbeek.youtube-dl-gui.savedState",
  ]
end
