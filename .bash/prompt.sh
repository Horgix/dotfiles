# prompt.sh
# My extravagant multi-line bash prompt.

# Enables/disables bold
bold='\[\e[1m\]'
nobold='\[\e[22m\]'

# Resets all styles
reset='\[\e[0m\]'

# n = \n
n='\n'

# hc = Host color
# sc = Separator color
# dc = Dir color
# pc = Prompt color
hc='\[\e[31m\]'
sc='\[\e[32m\]'
dc='\[\e[33m\]'
pc='\[\e[34m\]'

l2="$pc> $reset"

l1_start="$bold$hc\u$sc@$hc\H $dc\w"
l1_end="$pc\D{%y-%m-%d %H:%M:%S}"

export PS1="$n$l1_start $l1_end$n$l2"
