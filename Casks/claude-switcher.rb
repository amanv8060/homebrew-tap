cask "claude-switcher" do
  version "1.2.1"
  sha256 "635a1d3e269420826c380f67dbab2c78c754a59b331663a9e00a3e5d7120e5c2"

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
