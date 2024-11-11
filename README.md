# Dotfiles

Truly a labour of love, and a time capsule. I use these files on every computer
I run, and they support the computers I run, kind of by definition. That's
macOS and a little bit of Fedora.

Everything in here certainly was used at some point, but right now, the things
I am most maintaining are:

+ zsh
+ git
+ vim
+ bat
+ iterm
+ liquidprompt

In addition to this, you can find a few little scripts I use in the `bin`
directory, and some Python scripts to support those in lib.

## Installing

Clone this somewhere, and run

```
./script/bootstrap.sh
```

This will need to be run any time that new files are added to the dotfiles.
Every file in `*/*.symlink` will be symlinked to `~/.basename`, and every file
or folder called `*/*.xdg.symlink` will be symlinked to `~/.config/basename`.

There is no garbage collection. If you remove something, you will also need to
remove the now dangling symlink.

Post-installation, you will also want to copy `zsh/zsh.symlink/secret.dist` to
`zsh/zsh.symlink/secret` and edit the appropriate values. Also if you're not
me, you'll need to change the SSH signing public key in
`git/gitconfig.symlink`.
