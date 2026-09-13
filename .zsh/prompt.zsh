## PROMPT ## 

# Prompt symbol
PROMPT='%B%K{164}%F{231} %# %f%k%b'

# Current directory
PROMPT+='%B%K{98}%F{231} %~ %f%k%b'

# Start command input on a new line
PROMPT+=$'\n'

# Command input indicator
PROMPT+='%B%F{33}->%f%b '


## RIGHT SIDE PROMPT ##
autoload -Uz vcs_info

precmd_vcs_info() {
  vcs_info
}

precmd_functions+=(precmd_vcs_info)

setopt prompt_subst
RPROMPT='$vcs_info_msg_0_'

zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git

## CORRECTION PROMPT ##
SPROMPT='⚠️  Correct %B%F{196}%R%f%b to %B%F{green}%r%f%b ?
[n=no; y=yes; a=abort; e=edit] '
