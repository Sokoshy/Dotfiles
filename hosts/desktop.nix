{ config, lib, pkgs, modulesPath, ... }:

{
    imports = [ (
        modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot = {
        initrd = {
            availableKernelModules = [
               "xhci_pci"
               "ahci"
               "usb_storage"
               "usbhid"
               "sd_mod"
            ];
            kernelModules = [];
        };
        kernelModules = [
            "kvm-amd"
        ];
        extraModulePackages = [ ];
    };

    hardware = {
       cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
       graphics = {
         #enable = true;
         enable32Bit = true;
       };
    };

    fileSystems = {
        "/" = {
            device = "/dev/disk/by-uuid/f43a0f2e-44e7-4670-80b4-dbcd7ffee94d";
            fsType = "btrfs";
            options = ["subvol=@"];
        };
        "/boot" = {
            device = "/dev/disk/by-uuid/9573-0EDC";
            fsType = "vfat";
            options = [ "fmask=0077" "dmask=0077" ];
        };
    };

    swapDevices = [ ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp13s0.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp14s0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
