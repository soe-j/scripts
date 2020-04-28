# .dotfiles
~~~zsh
$ xcode-select --install

$ ssh-keygen -t ed25519

$ git config --global user.name "soe-j"
$ git config --global user.email "xxxxxxx+soe-j@users.noreply.github.com"

$ git clone git@github.com:soe-j/.dotfiles.git
$ cd .dotfiles
$ bin/setup.sh

# install language
$ **env [install|global] [version]

# setup aws
$ aws configure
~~~

## private settings
### ~/Documents/dotfiles-secrets/wifi.csv
sort of priority
~~~csv
ssid1,pass1
ssid2,pass2
~~~

## maintenance
### homebrew
#### add formula
~~~zsh
(add 'brew "great-formula"' to ./Brewfile)
$ brew bundle
~~~

#### remove
~~~zsh
(remove 'brew "ng-formula"' from ./Brewfile)
$ brew bundle cleanup --force

# update lock file
$ rm ./Brewfile.lock
$ brew bundle
~~~
