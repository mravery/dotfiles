My config files for *nixy environments. We use Dotbot for installation.

```
git clone git@github.com:mravery/me.config.git dotfiles
cd dotfiles
./install
```
# Submodules

* Prelude: https://github.com/bbatsov/prelude
* Dobot: https://github.com/anishathalye/dotbot

# Customization

## Theme

https://ethanschoonover.com/solarized/

## Emacs

## Requirements

version: =< 25

* Web files with mixed markup/processing languages are formatted via [web-mode](http://web-mode.org/).
* Current line is highlighted.
* `color-theme-solarized` and `solarized-theme` are both required for the theme to work. 🤷

## Git

* Colors are on.
* Email is anonymized: mravery@users.noreply.github.com
* Setup a number of shortcuts (i.e. aliases).

## Bash

* Define a number of helpful custom shell functions.
* `if-then` certain functionality based on OS being run (right now Mac or Linux).
* Set-up pretty prompt.
* Colorizes grep.
* 'ls' uses our theme.
