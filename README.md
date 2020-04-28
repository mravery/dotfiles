All my config files for *nixy environments. We use Dotbot for installation.

```
git clone git@github.com:mravery/me.config.git config
cd config
./install
```
# Submodules

* Prelude: https://github.com/bbatsov/prelude
* Dobot: https://github.com/anishathalye/dotbot

# Customization

## Theme

https://ethanschoonover.com/solarized/

## emacs

For now, I mostly use emacs for web based development. The current features reflect this
particular neeed. REQUIRES EMACS =< 24.

* Web files with mixed markup/processing languages are formatted via [web-mode](http://web-mode.org/).
* Current line is highlighted.

## git

Features:

* Turn on colors.
* Initialize user and email to me.
* Setup a number of shortcuts (i.e. aliases).

## bash

Features:

* Define a number of helpful custom shell functions.
* `if-then` certain functionality based on OS being run (right now Mac or Linux).
* Set-up pretty prompt.
* Colorizes grep.
* 'ls' uses our theme.
