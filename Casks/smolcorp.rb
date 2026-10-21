cask "smolcorp" do
  version "1.12.1"
  sha256 "0724fea8a639b8bcf30f18c4f9ec0420e0305e7b10b1b5036dcb22c646ec0e7b"

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
