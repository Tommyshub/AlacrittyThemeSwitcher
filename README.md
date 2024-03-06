# Alacritty Theme Switcher

This repository contains a bash script for easy switching between themes for Alacritty, a GPU-accelerated terminal emulator. It's designed for my personal use, but feel free to adapt and use it for your setup.

## Getting Started

**Clone the repository:**

```
https://github.com/Tommyshub/AlacrittyThemeSwitcher
```

After cloning the AlacrittyConfig repository, you will find a directory structure that mirrors the expected setup in your home directory. Here's how to use it:

**Move the directories to your home folder (~):**

Ensure to move the **.config/alacritty** directory and its contents to the appropriate location in your home directory. This typically means executing:

**And move the script to a location of your choice, for example:**

```
mv AlacrittyConfig/.local/share/switch_alacritty_theme.sh ~/.local/share/
```

**Make sure the script is executable:**

```
chmod +x ~/.local/share/switch_alacritty_theme.sh
```

## Using the Script

To change your Alacritty theme, simply run:

```
~/.local/share/switch_alacritty_theme.sh
```

Follow the prompts to select your desired theme.

## Adding an Alias

For convenience, you might want to add an alias to your .bashrc or .zshrc:

```
alias ChangeAlacrittyTheme='~/.local/share/switch_alacritty_theme.sh'
```

After adding, refresh your shell or open a new terminal window to use the alias.

## Customization

Feel free to place the files in a way that makes sense for your setup, and customize the themes or script as needed. The structure provided is a guideline that can be adjusted to fit different environments or preferences.

## Acknowledgements

Themes are sourced from the [official Alacritty Theme](https://github.com/alacritty/alacritty-theme/) repository, which is under the Apache-2.0 license. Thanks to the creators and contributors for their work on these themes.
