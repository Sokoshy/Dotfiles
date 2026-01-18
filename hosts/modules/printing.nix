# { pkgs, ... }:
{
    services.printing = {
    enable = true;
    # drivers = with pkgs; [ gutenprint canon-cups-ufr2 cups-filters ];
    };
    # services.avahi = {
    #   enable = true;
    #   nssmdns4 = true;
    #   openFirewall = true;
    # };
}