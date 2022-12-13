#!/bin/bash

# Check if brew is already installed
if ! [ -x "$(command -v brew)" ]; then
  # Install Homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Brew is already installed. Skipping installation."
fi

# Install packages with brew

# curl
if ! brew install curl; then
  echo "Failed to install Spotify. Skipping."
fi

# Spotify
if ! brew install spotify; then
  echo "Failed to install Spotify. Skipping."
fi

# Spectacle
if ! brew install spectacle; then
  echo "Failed to install Spectacle. Skipping."
fi

# jEnv
if ! brew install jenv; then
  echo "Failed to install jEnv. Skipping."
fi

# npm
if ! brew install npm; then
  echo "Failed to install npm. Skipping."
fi

# yarn
if ! brew install yarn; then
  echo "Failed to install yarn. Skipping."
fi

# node
if ! brew install node; then
  echo "Failed to install node. Skipping."
fi

# Download IntelliJ DMG file
curl -L -o intellij.dmg https://download.jetbrains.com/idea/ideaIC-2021.2.3.dmg

# Install IntelliJ
hdiutil attach intellij.dmg
cp -R "/Volumes/IntelliJ IDEA/IntelliJ IDEA.app" /Applications
hdiutil detach "/Volumes/IntelliJ IDEA"
