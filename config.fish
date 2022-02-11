if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
    set -x HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
    set -x HOMEBREW_BOTTLE "https://mirrors.ustc.edu.cn/homebrew-bottlet"
    set -x fish_greeting ""
    set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
    set -x FZF_DEFAULT_OPTS '--preview "bat --style=numbers --color=always --line-range :500 {}"'
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/.emacs.d/bin
    fish_add_path /usr/local/opt/coreutils/libexec/gnubin
    fish_add_path /usr/local/opt/grep/libexec/gnubin
    alias python="python3"
    alias ls="exa"
    alias cat="bat"
    alias em="emacs"
    alias gcc="gcc-11"
end
