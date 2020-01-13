# ~/.bashrc
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

INTERACTIVE_BASHPID_TIMER="/tmp/${USER}.START.$$"
PS0='$(echo $SECONDS > "$INTERACTIVE_BASHPID_TIMER")'

function _update_ps1() {
    local __ERRCODE=$?

    local __DURATION=0
    if [ -e $INTERACTIVE_BASHPID_TIMER ]; then
        local __END=$SECONDS
        local __START=$(cat "$INTERACTIVE_BASHPID_TIMER")
        __DURATION="$(($__END - ${__START:-__END}))"
        rm -f "$INTERACTIVE_BASHPID_TIMER"
    fi

    PS1="$( \
        $GOPATH/bin/powerline-go \
        -error $__ERRCODE \
        -numeric-exit-codes \
        -cwd-max-depth 4 \
        -duration $__DURATION \
        -modules "nix-shell,venv,ssh,cwd,perms,hg,jobs,duration,exit,root,vgo" \
    )"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
