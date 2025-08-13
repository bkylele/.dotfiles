# Borgden Dots

I like to experiment a lot with workflows, many things are subject to change.

## Installation

Clone the repo into home, then run the install script:
```bash
$ git clone https://github.com/bkylele/.dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./install.sh
```

If the install ever gets more complicated than the above, feel free to **euthanize me** as I have lost my way.

## Quirks/Workarounds

At the time of this writing, I mainly use this setup on a Surface Pro 8.
Thus some scripts are specialized for laptop specific behaviors and such. Here's a list of some things I've encountered:

#### - Closing the laptop lid will awaken the device from suspend
[See workaround](https://github.com/linux-surface/linux-surface/wiki/Known-Issues-and-FAQ#suspend-aka-sleep-vs-lid-closingopening-events)

#### - Nix Shells permission denied
Might be a quirk with using nix on Arch Linux, but sometimes the nix store changes owners from user to root. A simple `chown` will suffice:
```bash
$ sudo chown -R user /nix
```
