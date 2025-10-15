# Borgden Dots

I like to experiment a lot with workflows, many things are subject to change.

## Installation

WIP, this branch is working on switching to using GNU Guix.

Clone the repo into home, then create a new generation with `guix home`:

```bash
$ git clone https://github.com/bkylele/.dotfiles.git ~/.dotfiles
$ guix home reconfiure ~/.dotfiles/home.scm
```

## Quirks/Workarounds

At the time of this writing, I mainly use this setup on a Surface Pro 8.
Thus some scripts are specialized for laptop specific behaviors and such. Here's a list of some things I've encountered:

#### - Closing the laptop lid will awaken the device from suspend
[See workaround](https://github.com/linux-surface/linux-surface/wiki/Known-Issues-and-FAQ#suspend-aka-sleep-vs-lid-closingopening-events)

> As a current workaround, or also to just not be bothered by any lid events with regards to the power state, disable or blacklist the "surface_gpe" module in the kernel:
```bash
$ sudo modprobe -r surface_gpe
$ sudo bash -c 'echo -e "\n# Blacklisting lid vs. suspend issue module\nblacklist surface_gpe" >> /etc/modprobe.d/blacklist.conf'
```

#### - Squeekboard not appearing
[See fix](https://github.com/droidian/squeekboard?tab=readme-ov-file#running)

> Squeekboard honors the gnome "screen-keyboard-enabled" setting. Either enable this through gnome-settings under accessibility or run:
```bash
$ gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled true
```
