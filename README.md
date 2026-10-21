# idevtim/tap

Homebrew casks for apps by [idevtim](https://idevtim.com).

| App | Install |
|---|---|
| [Isleta](https://tryisleta.com) — the notch, finally doing something | `brew install --cask idevtim/tap/isleta` |
| [ChillMac](https://github.com/idevtim/chillmac) — menu bar system monitor and fan control | `brew install --cask idevtim/tap/chillmac` |
| [LunoPeak](https://lunopeak.com) — one dashboard for every Claude Code, Codex and Cursor session | `brew install --cask idevtim/tap/lunopeak` |

Each app updates itself once installed (Isleta and ChillMac through Sparkle, LunoPeak through its
built-in updater), so `brew upgrade` leaves them alone unless you pass `--greedy`. To remove one
along with everything it stored:

```sh
brew uninstall --zap --cask <name>
```

Isleta needs macOS 26 or later and ChillMac needs macOS 13 or later; both require Apple silicon.
LunoPeak is a universal build that runs on macOS 10.15 or later, Intel or Apple silicon.

Isleta's and ChillMac's release scripts bump their casks here, so those are never more than one
push behind the release they name. LunoPeak's cask is bumped by hand for now.
