alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias zshrc="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimrc="nvim ~/.vimrc"
alias ng="ngrok http -subdomain=steve"

alias copyjs="pbpaste | highlight --font Menlo --font-size 24 --style solarized-dark --syntax=js -O rtf | pbcopy"
alias copyhtml="pbpaste | highlight --font Menlo --font-size 24 --style solarized-dark --syntax=html -O rtf | pbcopy"
alias copycss="pbpaste | highlight --font Menlo --font-size 24 --style solarized-dark --syntax=css -O rtf | pbcopy"
alias copyliquid="pbpaste | highlight --font Menlo --font-size 24 --style solarized-dark --syntax=liquid -O rtf | pbcopy"
alias notes="cd ~/Dropbox/Notes && nvim"
alias be="bundle exec"
alias br="bin/rails"
alias weather="curl http://v2.wttr.in"

alias dus="dev up && dev s"

function smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

function ngrokShop () { ngrok http -subdomain=steve -host-header=$1.myshopify.io $1.myshopify.io:80 }

function ngrokSteve () { ngrok http -subdomain=steve -host-header=$1 $1:80 }

eval $(thefuck --alias)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
