cask "smolcorp" do
  version "1.12.0"
  sha256 "4a8f8cd26368c31ebd6a05400b1ea0be93497cdb1b9b8c73fe04bfd01a28f6c1"

  url "https://github.com/Sauzze/smolcorp/releases/download/v#{version}/Smolcorp.zip"
  name "Smolcorp"
  desc "Control pad on your phone for the AI coding agents in your terminal"
  homepage "https://github.com/Sauzze/smolcorp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Smolcorp.app"

  uninstall launchctl: "io.github.sauzze.agentdeck",
            quit:      "io.github.sauzze.agentdeck"

  zap trash: [
    "~/Library/Application Support/AgentDeck",
    "~/Library/LaunchAgents/io.github.sauzze.agentdeck.plist",
  ]

  caveats <<~EOS
    Smolcorp isn't notarised by Apple. The first time you open it, and after
    each update, macOS says it can't check it for malicious software: click
    Done, then go to System Settings > Privacy & Security and click Open
    Anyway next to Smolcorp.

    After each update, also turn Smolcorp back on under
    System Settings > Privacy & Security > Accessibility.
  EOS
end
