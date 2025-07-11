#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Starting bootstrap..."

# 1. Install Homebrew if missing and update
if ! command -v brew &>/dev/null; then
  echo "🔧 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed."
fi

echo "🔄 Updating Homebrew..."
brew update

# 2. Install applications, tools, and fonts
echo "🔧 Installing Alacritty..."
brew install --cask alacritty

echo "🔧 Installing Iosevka Nerd Font..."
brew install --cask font-iosevka-nerd-font

echo "🔧 Installing nvim, stow, neofetch, tmux, lazygit, amethyst"
brew install nvim stow neofetch tmux lazygit amethyst npm

echo "🔧 Installing anthropic-ai/claude-code"
npm install -g @anthropic-ai/claude-code

# 3. Create ~/.hushlogin if it doesn’t exist
echo "🧘 Creating ~/.hushlogin to suppress 'Last login'..."
if [ ! -f "${HOME}/.hushlogin" ]; then
  touch "${HOME}/.hushlogin"
  echo "✅ ~/.hushlogin created."
else
  echo "✅ ~/.hushlogin already exists."
fi

# 4. Run stow to symlink
cd "${DOTFILES_DIR}"
echo "🔍 Previewing stow actions with --simulate:"
stow --simulate .

echo "🔗 Applying stow symlinks with --restow:"
stow --restow .

echo "🎉 Bootstrap complete! Restart the terminal to apply changes."

exit 0
