cask "claude-usage-widget" do
  version "1.1.8"
  sha256 "8ff20768ad97ddc22209201d9862f4a14b02c3fdffeb4e909deee0591a6a476e"

  url "https://github.com/malek-gatoufi/claude-usage-widget/releases/download/v1.1.8/ClaudeUsage.zip"
  name "Claude Usage Widget"
  desc "macOS menu bar + desktop widget for Claude usage monitoring"
  homepage "https://github.com/malek-gatoufi/claude-usage-widget"

  app "ClaudeUsage.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/ClaudeUsage.app"]

    # Install widget-server.py and LaunchAgent
    server_src = "#{appdir}/ClaudeUsage.app/Contents/Resources/widget-server.py"
    server_dst = "#{Dir.home}/.claude-widget/widget-server.py"
    plist_dst  = "#{Dir.home}/Library/LaunchAgents/lekmax.ClaudeUsage.WidgetData.plist"

    FileUtils.mkdir_p "#{Dir.home}/.claude-widget"
    FileUtils.cp server_src, server_dst
    File.chmod(0755, server_dst)

    File.write(plist_dst, <<~PLIST)
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>lekmax.ClaudeUsage.WidgetData</string>
          <key>ProgramArguments</key>
          <array>
              <string>/usr/bin/python3</string>
              <string>#{server_dst}</string>
          </array>
          <key>KeepAlive</key>
          <true/>
          <key>RunAtLoad</key>
          <true/>
          <key>StandardErrorPath</key>
          <string>/tmp/ClaudeUsageWidget.log</string>
      </dict>
      </plist>
    PLIST

    system_command "/bin/launchctl",
      args: ["unload", plist_dst], print_stderr: false
    system_command "/bin/launchctl",
      args: ["load", "-w", plist_dst]
  end

  zap trash: [
    "~/Library/Application Support/ClaudeUsage",
    "~/Library/LaunchAgents/lekmax.ClaudeUsage.WidgetData.plist",
    "~/.claude-widget",
  ]
end
