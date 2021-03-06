Installation:

		For Linux/Unix:
			git clone https://github.com/xqin/dotvim.git ~/.vim

		For Windows 7:
			git clone https://github.com/xqin/dotvim.git X:\path_to_vim_folder\vimfiles


Create symlinks:

		For Linux/Unix:
			ln -s ~/.vim/vimrc ~/.vimrc

		For Windows 7:
			X:
			cd X:\path_to_vim_folder\
			mklink _vimrc vimfiles\vimrc


Switch to the `.vim` or `vimfiles` directory, and fetch submodules:

    cd .vim
        or
    cd vimfiles

    git submodule init
    git submodule update

    Upgrading all bundled plugins
    git submodule foreach git pull origin master


To remove a submodule you need to:

    Delete the relevant line from the `.gitmodules` file.

    Delete the relevant section from `.git/config`.

    Run `git rm --cached path_to_submodule` (no trailing slash).

    Delete the now untracked submodule files.

    Run `rm -rf path_to_submodule`

    Commit the superproject.

    `git commit . -m 'remove submodule'`


[Synchronizing plugins with git submodules and pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
