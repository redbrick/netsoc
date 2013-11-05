# {{ ansible_managed }}

export RBENV_ROOT="{{ rbenv.dir }}"
export PATH="$RBENV_ROOT/bin:$PATH"

eval "$(rbenv init -)"
