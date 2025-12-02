alias vim='nvim'
#alias lvim='NVIM_APPNAME=lazyvim nvim'
alias vim_raw='vim -u NONE -U NONE -N -i NONE'

export EDITOR="nvim"
export LESS="-RFX"

set_tab_title() {
  wezterm cli set-tab-title "$1"
}

alias tabtitle='set_tab_title'
alias play_song='yt-dlp -x --audio-format mp3 https://www.youtube.com/watch\?v\=4xDzrJKXOOY -o - 2>/dev/null | ffplay -nodisp  -autoexit -i - &>/dev/null'
