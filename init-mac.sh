#!/bin/bash

# Check if brew is already installed
if ! [ -x "$(command -v brew)" ]; then
  # Install Homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Brew is already installed. Skipping installation."
fi

echo "Updating brew, this may take a while."
brew update > /dev/null

# Install applications with Brew
apps=(
  azure-cli
  curl 
  spotify 
  spectacle 
  jenv 
  npm 
  yarn 
  node
)

for app in "${apps[@]}"; do
  if ! brew list | grep -q "$app"; then
    if ! brew install "$app"; then
      printf "\e[31mFailed to install $app. Skipping.\e[0m\n"
    else
      printf "\e[32mSuccessfully installed $app.\e[0m\n"
    fi
  else
    printf "\e[33m$app is already installed. Skipping.\e[0m\n"
  fi
done

# Application Configuration
# jEnv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc

# Install DMG applications
# Download IntelliJ DMG file
curl -L -o intellij.dmg https://download.jetbrains.com/idea/ideaIC-2021.2.3.dmg

# Install IntelliJ
hdiutil attach intellij.dmg
cp -R "/Volumes/IntelliJ IDEA/IntelliJ IDEA.app" /Applications
hdiutil detach "/Volumes/IntelliJ IDEA"
