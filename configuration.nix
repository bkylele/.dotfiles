# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };

  # pin control modules aren't loaded correctly for surface.
  # this fixes physical buttons not working
  boot.initrd.availableKernelModules = [ "pinctrl_tigerlake" ];

  # Suspend when pressing the power 
  services.logind.settings.Login.HandlePowerKey = "suspend";

  # Surface GPE/Lid driver to enable wakeup from suspend via the lid.
  boot.blacklistedKernelModules = [ "surface_gpe" ];

  networking.hostName = "buggy";

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Los_Angeles";

  environment.sessionVariables = {
    XDG_CACHE_HOME      = "$HOME/.cache";
    XDG_CONFIG_HOME     = "$HOME/.config";
    XDG_DATA_HOME       = "$HOME/.local/share";
    XDG_STATE_HOME      = "$HOME/.local/state";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.nh.enable = true;
  programs.direnv.enable = true;
  programs.firefox.enable = true;
  programs.niri.enable = true;
  programs.steam.enable = true;

  services.gvfs.enable = true; # required for certain nautilus functions

  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # login handled by niri
        command = "${config.programs.niri.package}/bin/niri-session";
        user = "brian";
      };
    };
  };

  # User Profiles
  users.users.brian = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # System Profile
  environment.systemPackages = with pkgs; [
    # neovim
    inputs.neovim.packages.${pkgs.system}.default

    git
    htop
    zoxide
    fzf
    ripgrep
    fd
    bat
    btop

    brightnessctl
    wf-recorder
    slurp
    nautilus
    hyprlock
    hypridle
    mako
    quickshell
    mpv
    imv

    kitty
    fuzzel
    vesktop
    catppuccin-cursors.mochaDark
    xwayland-satellite
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}

