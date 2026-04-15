cask "claude-usage-widget" do
  version "1.1.2"
  sha256 "25647cab02890d25e50a79a7a3f4bb74216c2335b7b43bf643e07aa1f185bf71"

  url "https://github.com/malek-gatoufi/claude-usage-widget/releases/download/v1.1.2/ClaudeUsage.zip"
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
