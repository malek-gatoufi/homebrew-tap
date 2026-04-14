cask "claude-usage-widget" do
  version "1.1.1"
  sha256 "a68f89800bbd176eab815e3da7b34e02c14f379d44869e8244d74bbfd147e094"

  url "https://github.com/malek-gatoufi/claude-usage-widget/releases/download/v1.1.1/ClaudeUsage.zip"
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
