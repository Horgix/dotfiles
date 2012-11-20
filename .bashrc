# .bashrc
# Source every configuration file in .bash

for f in ~/.bash/*; do source $f; done
for f in ~/.shell-config/*; do source $f; done
test -d ~/.local.bash/ && for f in ~/.local.bash/*; do source $f; done

test -f ~/.extra-paths && source ~/.extra-paths

true
