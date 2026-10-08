cask "claude-switcher" do
  version "1.0.1"
  sha256 "df055af88733a1ef46b5cbb5d992362f97c956039113343d4ad0d36cfaab262e"

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
