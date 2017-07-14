# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../common.nix
    ../../services/xserver.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  # Hardware settings
  hardware = {
    cpu.intel.updateMicrocode = true;
    trackpoint.enable = true;
    pulseaudio.enable = true;
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    fish
    curl
    emacs
    htop
    git
    gnupg
    ccid
  ];

  networking = {
    hostName = "prosser";
    networkmanager.enable = true;

    firewall = {
      enable = true;

      # 1714-1764 is KDE Connect
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedTCPPorts = [ 22 ];
      # allowedUDPPorts = [ ... ];
    };
  };

  # List services that you want to enable:
  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;
    openssh.permitRootLogin = "no";
    openssh.passwordAuthentication = false;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the smartcard deamon.
    pcscd.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.etu = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  # Root shell
  users.extraUsers.root.shell = pkgs.fish;
}