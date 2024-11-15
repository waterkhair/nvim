alias sourcep='source ~/.profile'
alias nvima='nvim ~/.config/alacritty/alacritty.toml'
alias nvimc='nvim .'
alias nvimp='nvim ~/.profile'
alias nvims='nvim ~/.config/nvim'
alias nvimt='nvim ~/.tmux.conf'
alias nvimn='nvim ~/Notes'
alias tmuxn='tmux new -s'
alias tmuxa='tmux a -t'
alias tmuxl='tmux ls'
alias tmuxr='tmux source ~/.tmux.conf'
alias tmuxk='tmux kill-session'
alias tmuxe='tmux kill-session -a -t'
alias rmmodules='find . -name "node_modules" -prune -exec rm -rf "{}" +'
alias rst='reset'
alias emptycommit='git commit --allow-empty -m '
alias p10kconfig='p10k configure'

### ALACRITTY CONFIG
NORMAL_FAMILY="normal.family"
HACK_NERD_FONT="\'Hack Nerd Font\'"
HACK_NERD_FONT_MONO="\'Hack Nerd Font Mono\'"
MESLO_NERD_FONT="\'MesloLGL Nerd Font\'"
MONONOKI_NERD_FONT="\'Mononoki Nerd Font\'"
alias ablur='sed -i "" "s/\(blur *= *\).*/\blur = true/" ~/.config/alacritty/alacritty.toml'
alias aunblur='sed -i "" "s/\(blur *= *\).*/\blur = false/" ~/.config/alacritty/alacritty.toml'
alias ahack='sed -i "" "s/\($NORMAL_FAMILY *= *\).*/\1$HACK_NERD_FONT/" ~/.config/alacritty/alacritty.toml'
alias ahackmono='sed -i "" "s/\($NORMAL_FAMILY *= *\).*/\1$HACK_NERD_FONT_MONO/" ~/.config/alacritty/alacritty.toml'
alias ameslo='sed -i "" "s/\($NORMAL_FAMILY *= *\).*/\1$MESLO_NERD_FONT/" ~/.config/alacritty/alacritty.toml'
alias amononoki='sed -i "" "s/\($NORMAL_FAMILY *= *\).*/\1$MONONOKI_NERD_FONT/" ~/.config/alacritty/alacritty.toml'
alias afont12='sed -i "" "s/\(size *= *\).*/\size = 12/" ~/.config/alacritty/alacritty.toml'
alias afont14='sed -i "" "s/\(size *= *\).*/\size = 14/" ~/.config/alacritty/alacritty.toml'
alias afont16='sed -i "" "s/\(size *= *\).*/\size = 16/" ~/.config/alacritty/alacritty.toml'
alias afont18='sed -i "" "s/\(size *= *\).*/\size = 18/" ~/.config/alacritty/alacritty.toml'
alias aopa0='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.0/" ~/.config/alacritty/alacritty.toml'
alias aopa1='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.1/" ~/.config/alacritty/alacritty.toml'
alias aopa2='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.2/" ~/.config/alacritty/alacritty.toml'
alias aopa3='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.3/" ~/.config/alacritty/alacritty.toml'
alias aopa4='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.4/" ~/.config/alacritty/alacritty.toml'
alias aopa5='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.5/" ~/.config/alacritty/alacritty.toml'
alias aopa6='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.6/" ~/.config/alacritty/alacritty.toml'
alias aopa7='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.7/" ~/.config/alacritty/alacritty.toml'
alias aopa8='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.8/" ~/.config/alacritty/alacritty.toml'
alias aopa9='sed -i "" "s/\(opacity *= *\).*/\opacity = 0.9/" ~/.config/alacritty/alacritty.toml'
alias aopa10='sed -i "" "s/\(opacity *= *\).*/\opacity = 1.0/" ~/.config/alacritty/alacritty.toml'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jesusbarajas/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
