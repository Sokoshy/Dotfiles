{
    boot.loader.grub.extraEntries = ''
        menuentry "Cachyos" {
        insmod btrfs
        search --no-floppy --fs-uuid --set=root 34199825-db0b-4a7d-9482-d0b19f7defb7
        inux /@/boot/vmlinuz-linux-cachyos root=UUID=34199825-db0b-4a7d-9482-d0b19f7defb7 rw rootflags=subvol=@
        initrd /@/boot/initramfs-linux-cachyos.img
        }
    '';
}
