{hostname, ...}: {
    boot.initrd.systemd.network.wait-online.enable = false;

    networking = {
        hostName = "${hostname}";
        networkmanager.enable = true;
    };
}
