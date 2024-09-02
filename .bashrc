if [ -z "$PS1" ]; then
  return
fi

eval "$(fnm env --use-on-cd bash)"
