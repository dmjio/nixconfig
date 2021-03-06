# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."disk".device = "/dev/disk/by-uuid/61ea4dca-c490-4f56-85e4-54873669c7f7";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/cc869eb3-1e03-4952-b53c-9edda00ee243";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/fdde2451-dfb9-4494-8a73-402cdf83c63b";
      fsType = "ext4";
      options = [ "noauto" "x-systemd.automount" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/AFD2-F740";
      fsType = "vfat";
      options = [ "noauto" "x-systemd.automount" ];
    };

  fileSystems."/mnt/hactar" =
    { device = "10.3.0.2:/media/files";
      fsType = "nfs4";
      options = [ "ro" "noauto" "x-systemd.automount" ];
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = "powersave";
}
