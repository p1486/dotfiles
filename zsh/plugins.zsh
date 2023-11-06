### plugins

if [ ! -e ~/.zsh-plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions
fi

if [ ! -e ~/.zsh-plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh-plugins/zsh-syntax-highlighting
fi

if [ ! -e ~/.zsh-plugins/zsh-completions ]; then
    git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh-plugins/zsh-completions
    rm -f ~/.zcompdump; compinit
fi

source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
