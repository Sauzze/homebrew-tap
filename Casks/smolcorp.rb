cask "smolcorp" do
  version "1.11.0"
  sha256 "4008a1eee37927edbe6441f04a1f7273a9f07b5e5bd8b07810cf5f1f9bbd70c4"

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
