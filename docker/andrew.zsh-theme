# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

function echo_blank() {
  echo
}

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

preexec_functions+=echo_blank
precmd_functions+=echo_blank

export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}

add-zsh-hook precmd virtenv_indicator

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✖︎"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}●"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}


# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
# PROMPT="
# %{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
# %{$fg[cyan]%}%n \
# %{$fg[white]%}at \
# %{$fg[green]%}$(box_name) \
# %{$fg[white]%}in \
# %{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
# ${hg_info}\
# ${git_info} \
# %{$fg[white]%}[%*]
# %{$terminfo[bold]$fg[red]%}→ %{$reset_color%}"

# Prompt format: \n # USER in DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT="%(1V.%{$fs_bold[yellow]%}(%1v) %{$reset_color%}.)%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n\
%{$fg[red]%}@%M \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${hg_info}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}> %{$reset_color%}"

# if [[ "$USER" == "root" ]]; then
# PROMPT="
# %{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
# %{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
# %{$fg[white]%}at \
# %{$fg[green]%}$(box_name) \
# %{$fg[white]%}in \
# %{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
# ${hg_info}\
# ${git_info} \
# %{$fg[white]%}[%*]
# %{$terminfo[bold]$fg[red]%}→ %{$reset_color%}"
# fi

if [[ "$USER" == "root" ]]; then
PROMPT="%(1V.%{$fs_bold[yellow]%}(%1v)%{$reset_color%}.) %{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${hg_info}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}> %{$reset_color%}"
fi
