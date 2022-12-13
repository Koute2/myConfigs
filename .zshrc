zinit wait lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down" \
        zsh-users/zsh-history-substring-search  \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions \
    changyuheng/zsh-interactive-cd \
    zdharma-continuum/history-search-multi-word

zinit lucid light-mode for \
    atload"_evalcache starship init zsh" \
        mroth/evalcache

eval "$(fnm env --use-on-cd)"
