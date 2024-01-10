#!/bin/bash

RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'

command_exists () {
    command -v $1 >/dev/null 2>&1;
}


installHombrew() {
    if command_exists brew; then
        echo "Homebrew already installed"
        return
    fi
    
    REQUIREMENTS='curl'
    if ! command_exists ${REQUIREMENTS}; then
         echo -e "${RED}To run me, you need: ${REQUIREMENTS}${RC}"
        exit 1
    fi


    if ! curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh|sh;then
        echo -e "${RED}Something went wrong during Hombrew install!${RC}"
        exit 1
    fi
}

configureHomebrew() {
	# Install taps
    echo -e "${YELLOW}Install brew taps ...${RC}"

    # BREW_TABS= 'homebrew/cask-versions homebrew/cask-fonts oven-sh/bun'
    # for tab in ${BREW_TABS}; do
    # 
    # done
    brew tap homebrew/cask-versions;
    brew tap homebrew/cask-fonts;
    brew tap oven-sh/bun; # for macOS and Linux

    echo -e "${YELLOW}Install brew package ...${RC}"
    brew install bat bat-extras bun autojump amazon-ecs-cli awscli bison \
    cocoapods ffmpeg fizz flac git \
    mas neofetch nvm openssl pixman \
    python rust scrcpy starship tmux watchman \
    wget xz zsh;
}

installStarship() {
    if command_exists starship; then
        echo "Starship already installed"
        return
    fi

    if ! curl -sS https://starship.rs/install.sh|sh;then
        echo -e "${RED}Something went wrong during starship install!${RC}"
        exit 1
    fi
}

installHombrew
configureHomebrew



