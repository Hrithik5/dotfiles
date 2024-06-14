# My Dotfiles

This is where I keep all of my dotfiles.

Feel free to copy any of the dotfiles or scripts you find here, as much of it is just copied from other's dotfiles. I wouldn't recommend cloning my entire setup, but instead to try copying bits and pieces as you put together your own dotfiles unique to you.

In the future I'm planning on adding an install script to make it easier for others to use my configs. For now, you'll have to piece things together yourself, though.


### Ensure you have the following installed on your system

<!---
### For linux run the following steps
```
sudo apt install build-essential

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/{name_of_the_dir}/.profile

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

Verify with this -> brew doctor

```
--->

```
Install brew from offical website.
brew install git
brew install stow
```

### Installation

Checkout the dotfile repo into your $HOME directory using git

```
git clone https://github.com/Hrithik5/dotfiles.git
cd dotfiles
```
then use GNU stow to create symlink

```
stow .
```
