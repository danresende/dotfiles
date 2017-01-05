#!/usr/bin/env bash

ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Remove old folder if it exists
if [ -e "$HOME/dotfiles" ]; then
	rm -rf "$HOME/dotfiles";
fi;

# Puts the files in the HOME dir
mv $ABSOLUTE_PATH $HOME

# Creates simlinks
for file in bashrc bash_profile; do
	if [ -r "$HOME/dotfiles/bashfiles/.$file" ] && [ -f "$HOME/dotfiles/bashfiles/.$file" ] ; then
		if [ -e "$HOME/.$file" ]; then
			rm -rf "$HOME/.$file"
		fi;
		ln -s "$HOME/dotfiles/bashfiles/.$file" "$HOME/.$file";
	fi;
done;
unset file;

source $ABSOLUTE_PATH/SublimeText/.sublime_profile;
source $ABSOLUTE_PATH/gitfiles/.git_profile;
