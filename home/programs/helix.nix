{ config, ...}:
{
  programs.helix = {
    enable = true;

    # config
    settings = {
      editor = {
        lsp.display-messages = true;
      };
      programs.helix.languages = {
        language-server = {
          jdtls = {
            command = "/nix/store/11n6d2avcj9gm03k7wbsmk84pzp45ckh-jdt-language-server-1.40.0/bin/jdtls";
            args = [
              "-data" "/home/${config.home.username}/.cache/jdtls/workspace"
              ];
          };
        };
        java = {
          auto-format = true;
          jdtls.javaHome = "/nix/store/48290hnlb13xmwjw9y16a1s785993bv7-openjdk-23-ga/lib/openjdk";
        };
      };
    };
  };
}
