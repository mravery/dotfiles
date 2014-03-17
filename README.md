me.config
===========

Contains all my config files for *nixy environments. The dream is to be able to execute the following to any new *nix environment and be magically setup.

```
git clone git@github.com:mravery/me.config.git config
cd config
./setup
```

##emacs

For now, I mostly use emacs for web based development. The current features reflect this
particular neeed.

* Web files with mixed markup/processing languages are formatted via [web-mode](http://web-mode.org/).
* Current line is highlighted.
* "Tomorrow Bright" is the current theme.

##git

Features:

* Turn on colors.
* Initialize user and email to me.
* Setup a number of shortctus (i.e. aliases).

##bash

Features:

* Define a number of helpful custom shell functions.
* `if-then` certain functionality based on OS being run (right now Mac or Linux).
* Set-up pretty prompt.

####TODO

* Write an install script that will automatically generate the symlinks to point the config files to the right place.
