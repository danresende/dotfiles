# Add `~/bin` to the `$PATH`
# export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles:
for file in $HOME/dotfiles/bashfiles/.{bash_prompt,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Created by homebrew
# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH