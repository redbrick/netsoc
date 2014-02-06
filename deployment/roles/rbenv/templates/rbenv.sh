# {{ ansible_managed }}

export RBENV_ROOT="{{ rbenv.path }}"
export PATH="$RBENV_ROOT/bin:$PATH"

eval "$(rbenv init -)"
