# ~/.bashrc
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

eval "$(starship init bash)"
