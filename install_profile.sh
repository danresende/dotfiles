#!/usr/bin/env bash

# Puts the files in the HOME dir
ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mv $ABSOLUTE_PATH $HOME

# Creates simlinks
for file in bashrc bash_profile; do
	if [ -r "$HOME/dotfiles/bashfiles/.$file" ] && [ -f "$HOME/dotfiles/bashfiles/.$file" ]; then
		if [ -e "$HOME/.$file"]; then
			rm -rf "$HOME/.$file"
		fi;
		ln -s "$HOME/dotfiles/bashfiles/.$file" "$HOME/.$file";
	fi;
done;
unset file;

# Creates simlink to Sublime Text preferences
$sublimefile="$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings";
if [ -e "$sublimefile"]; then
	rm -rf "$sublimefile";
fi;

ln -s "$HOME/dotfiles/SublimeText/Preferences.sublime-settings" "$sublimefile";

# Creates simlink to .gitconfig
$gitfile="$HOME/.gitconfig";
if [ -e "$gitfile"]; then
	rm -rf "$gitfile";
fi;

ln -s "$HOME/dotfiles/gitfiles/.gitconfig" "$gitfile";