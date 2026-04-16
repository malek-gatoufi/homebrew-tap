cask "claude-usage-widget" do
  version "1.1.4"
  sha256 "cd44fe41a9aa7009fee73fd1d6362307372bfa6c58ec1e96260a1acf4dc1cc03"

  url "https://github.com/malek-gatoufi/claude-usage-widget/releases/download/v1.1.4/ClaudeUsage.zip"
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
