cask "claude-usage-widget" do
  version "1.1.5"
  sha256 "fe71aec408b90f176c87c6465352052f3acb475889b4e942b33cb4ba40d34fe5"

  url "https://github.com/malek-gatoufi/claude-usage-widget/releases/download/v1.1.5/ClaudeUsage.zip"
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
