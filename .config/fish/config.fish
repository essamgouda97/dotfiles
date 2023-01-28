set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
command -qv nvim; alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

switch (uname)
	case Linux
		source (dirname (status --current-filename))/config-linux.fish
end
