#!/usr/bin/env bash

PLAY_ROUTES_AWK='/^(GET|POST|PUT|HEAD)/{r="";split($2, p, "/");if(p[2]=="api"){for (i=4;i<=length(p);i++) r=r p[i]  "/"; print r } else print $2 }'

_PlayRoutes() {
	local cur
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}

	case "$cur" in
		*)
			COMPREPLY=( $( compgen -W "$(awk "$PLAY_ROUTES_AWK" conf/routes)" -- $cur ) );;
	esac
	return 0
}

complete -F _PlayRoutes kinja-curl
