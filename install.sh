#!/bin/bash

# Install Brew package manager https://brew.sh/
if [ -f /usr/local/bin/brew ]; then
    echo "Brew is already installed"
else
    echo "Installing Brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install oh-my-zsh https://github.com/ohmyzsh/ohmyzsh
if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh is already installed"
else
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Hide crash reporter
defaults write com.apple.CrashReporter DialogType none

# Install Ansible and provision whole system https://docs.ansible.com/
echo "Installing Ansible..."
brew install ansible

echo "Provisioning the system wih Ansible..."
ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook main.yml
