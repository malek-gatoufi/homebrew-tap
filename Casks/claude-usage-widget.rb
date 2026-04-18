cask "claude-usage-widget" do
  version "1.1.6"
  sha256 "803e85f842266deb9b030d2d5db53a780dd270380783b00a9f6b6a1e9205e434"

  url "https://github.com/malek-gatoufi/claude-usage-widget/releases/download/v1.1.6/ClaudeUsage.zip"
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
