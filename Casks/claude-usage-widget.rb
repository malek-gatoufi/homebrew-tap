cask "claude-usage-widget" do
  version "1.1.3"
  sha256 "a83b36da1f4bc726fd8494ebd4bd22611575eeacfccef88fac44e55940581636"

  url "https://github.com/malek-gatoufi/claude-usage-widget/releases/download/v1.1.3/ClaudeUsage.zip"
  name "Claude Usage Widget"
  desc "macOS menu bar + desktop widget for Claude usage monitoring"
  homepage "https://github.com/malek-gatoufi/claude-usage-widget"

  app "ClaudeUsage.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/ClaudeUsage.app"]
  end

  zap trash: [
    "~/Library/Application Support/ClaudeUsage",
    "~/Library/LaunchAgents/lekmax.ClaudeUsage.WidgetData.plist",
    "~/.claude-widget",
  ]
end
