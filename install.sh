#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

linkables=(
	".aliases"
	".bash_profile"
	".config"
	".git-completion.bash"
	".inputrc"
	".oh-my-zsh"
	".oh-my-zsh-custom"
	".zsh"
	".zshrc"
)

for item in "${linkables[@]}"; do
	# if already exists
	if [ -e "$HOME/$item" ] || [ -L "$HOME/$item" ]; then
		# if different target
		if [ "$(readlink "$HOME/$item")" != "$DOTFILES/$item" ]; then
			echo "moving existing ~/$item to ~/${item}.bak"
			mv "$HOME/$item" "$HOME/${item}.bak"
		fi
	fi

	echo "creating symlink ~/$item -> $DOTFILES/$item"
	ln -s "$DOTFILES/$item" "$HOME/$item"
done
