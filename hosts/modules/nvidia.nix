{ config, pkgs, ... }:
{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true; #for wayland

    #prime
    prime = {
    offload.enable = true;

    intelBusId = "PCI:0@0:2:0";
    nvidiaBusId = "PCI:1@0:0:0";
    };
  };
}