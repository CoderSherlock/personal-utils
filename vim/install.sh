#!/bin/bash

# Exit on error
set -e

# --- Main Installation ---

echo "🚀 Starting Vim/Neovim configuration setup..."

# 1. Detect Editor (Vim or Neovim)
if command -v nvim >/dev/null 2>&1; then
    EDITOR="nvim"
    CONFIG_FILE="$HOME/.config/nvim/init.vim"
    PLUG_FILE="$HOME/.local/share/nvim/site/autoload/plug.vim"
else
    EDITOR="vim"
    CONFIG_FILE="$HOME/.vimrc"
    PLUG_FILE="$HOME/.vim/autoload/plug.vim"
fi

echo "Detected editor: $EDITOR"

# 2. Create config directory and symlink
mkdir -p "$(dirname "$CONFIG_FILE")"
ln -sf "$(pwd)/vimrc" "$CONFIG_FILE"

# 3. Install vim-plug
if [ ! -f "$PLUG_FILE" ]; then
    curl -fLo "$PLUG_FILE" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# 4. Install plugins
echo "Installing plugins..."
$EDITOR -u "$CONFIG_FILE" +PlugInstall +qall

echo "✅ Vim/Neovim configuration setup is complete!"
echo "Please restart your editor to apply the changes."
