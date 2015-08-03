set -e

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

if [ -d "$ZSH" ]; then
  exit
fi

hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/IsmailM/oh-my-zsh.git $ZSH || {
  exit
}

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
sed -i -e "/^export ZSH=/ c\\
export ZSH=$ZSH
" ~/.zshrc

sed -i -e "/export PATH=/ c\\
export PATH=\"$PATH\"
" ~/.zshrc

env zsh
. ~/.zshrc
