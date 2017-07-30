# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../services/common.nix
    ../../services/xserver.nix
  ];

  networking.hostName = "prosser";

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  # Hardware settings
  hardware.cpu.intel.updateMicrocode = true;
  hardware.trackpoint.enable = true;

  # Enable firewall.
  networking.firewall.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Add dialout group for serial ports.
  users.extraUsers.etu.extraGroups = [ "dialout" ];
}
