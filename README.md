# idevtim/tap

Homebrew casks for apps by [idevtim](https://idevtim.com).

| App | Install |
|---|---|
| [Isleta](https://tryisleta.com) — the notch, finally doing something | `brew install --cask idevtim/tap/isleta` |
| [ChillMac](https://github.com/idevtim/chillmac) — menu bar system monitor and fan control | `brew install --cask idevtim/tap/chillmac` |

Both apps update themselves through Sparkle once installed, so `brew upgrade` leaves them alone
unless you pass `--greedy`. To remove one along with everything it stored:

```sh
brew uninstall --zap --cask <name>
```

Isleta needs macOS 26 or later; ChillMac needs macOS 13 or later. Both require Apple silicon.

Each app's release script bumps its cask here, so a cask is never more than one push behind the
release it names.
