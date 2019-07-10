FROM ubuntu:18.04
MAINTAINER Shi Xiufeng "shixiufengvip@outlook.com"

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  apt-get clean && apt-get update && apt-get -y install tmux htop ruby rubygems vim-nox zsh git vim-nox wget curl ctags unzip build-essential cmake python3-dev ruby-dev

ENV USER shixiufeng
RUN useradd -m $USER
USER $USER
ENV HOME /home/$USER
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
COPY --chown=shixiufeng vimrc $HOME/.vimrc
COPY --chown=shixiufeng zshrc $HOME/.zshrc
COPY --chown=shixiufeng andrew.zsh-theme $HOME/.oh-my-zsh/themes/andrew.zsh-theme
COPY --chown=shixiufeng solarized.vim $HOME/.vim/colors/solarized.vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# RUN git clone https://github.com/wincent/command-t.git $HOME/.vim/bundle/command-t
# RUN cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t && ruby extconf.rb && make
# RUN git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
# RUN git clone --recursive https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
# RUN cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
# RUN vim -c 'PluginInstall' -c 'qa!'
RUN echo 'set-option -g default-shell /bin/zsh' >> $HOME/.tmux.conf
WORKDIR $HOME
CMD ["/bin/zsh"]
