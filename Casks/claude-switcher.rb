cask "claude-switcher" do
  version "1.1.0"
  sha256 "da933370044e8095a9a13f3046ba37a67fee14388da9651b77693e5c4c085981"

  url "https://github.com/amanv8060/claude-switcher/releases/download/v#{version}/Claude-Switcher-v#{version}.zip"
  name "Claude Switcher"
  desc "Menu bar app for switching Claude accounts and checking usage limits"
  homepage "https://github.com/amanv8060/claude-switcher"

  depends_on macos: :ventura

  app "Claude Switcher.app"

  # The app isn't notarized yet, so clear the quarantine flag Gatekeeper would block it with.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Claude Switcher.app"]
  end

  uninstall quit: "dev.amanverma.claude-switcher"

  zap trash: "~/Library/Application Support/ClaudeSwitcher"
end
