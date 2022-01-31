# i3wm Setup

Alex's i3wm setup. Branch per distro. Uses a productive and aesthetically pleasing combination of i3wm, lightdm, pywal, compton, and other fun stuff.

I realize it seems a bit strange to keep your home directory as a git repo... I created this because

1. My GNU/Linux setup is cool and I wanted to share
2. I want to keep my configurations in sync between desktop/laptop
3. Personalizing any Linux distro is time consuming, why not automate?

## Features

- Background image scripts pull the National Geographic or Bing photo of the day and set as background on login (new background photo every day!)
- The awesome [pywal](https://github.com/dylanaraps/pywal) tool extracts colors from the new background. Additional scripts color coordinate everything - urxvt (terminal), vscode, rofi, i3
- Other notable customizations include i3bar, lightdm slick greeter, rofi

## Instructions

1. Clone this repo
2. cd into the newly cloned repo `cd ubuntu-setup`
3. Run the setup script (as root) `sh setupUbuntu.sh`

### TODO

- PR for pywal to `#define` variables in .Xresources so we can edit rofi colors
  https://asyncial.github.io/blog/organize-your-.xresources-like-a-pro/
  https://gist.github.com/rawsh/9ae04a2bdbfce513ad0851d9277515d2

- Fix `redshift`
- Fix docker build for this branch
- "git preferences" like `git config --global pager.branch false`s
- zoom screen share picom
- solution to separate vscode settings.json from it's colors to prevent constant git updates
