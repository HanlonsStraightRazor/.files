git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
echo "# Helps with the lightline vim plugin" >> ~/.bashrc
echo "export TERM=xterm-256color" >>  ~/.bashrc
vim +PluginInstall +qall
rm -- "$0"
