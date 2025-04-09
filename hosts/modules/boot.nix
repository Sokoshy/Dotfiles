{ config, pkgs, ... }:
{

  boot = {
    tmp.cleanOnBoot = true;

    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
                efi.canTouchEfiVariables = true;

                systemd-boot.enable = true;

                # grub = {
                #     efiSupport = true;
                #     useOSProber = true;
                #     device = "nodev";
                #     configurationLimit = 10;
                # };
            };
        };
    time.hardwareClockInLocalTime = true;
}