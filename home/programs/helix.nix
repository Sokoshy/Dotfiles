{ config, ...}:
{
  programs.helix = {
    enable = true;

    # config
    settings = {
      editor = {
        lsp.display-messages = true;
      };
    };

    # language settings

    languages = {
      java = {
        syntax-highlighting = true;
        treesitter-textobjects = true;
        auto-indent = true;

        language-servers = {
          jdtls = {
            command = "/nix/store/11n6d2avcj9gm03k7wbsmk84pzp45ckh-jdt-language-server-1.40.0/bin/jdtls";
            args = [];
          };
        };
      };
    };
  };
}
