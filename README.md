# idevtim/tap

Homebrew tap for [Isleta](https://tryisleta.com) — the notch, finally doing something.

```sh
brew install --cask idevtim/tap/isleta
```

Isleta updates itself through Sparkle once installed, so `brew upgrade` will leave it alone
unless you pass `--greedy`. To remove it and everything it stored:

```sh
brew uninstall --zap --cask isleta
```

Requires macOS 26 or later on Apple silicon.
