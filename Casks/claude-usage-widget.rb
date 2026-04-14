cask "claude-usage-widget" do
  version "1.1.0"
  sha256 "0af74f84844d7e71b482e1b36f079af64dd991c9d6f34350c59a8c6aa4dbf321"

  url "https://github.com/malek-gatoufi/claude-usage-widget/releases/download/v#{version}/ClaudeUsage.zip"
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
