{ pkgs, ...}:
{
  programs.helix = {
      enable = true;
      package = pkgs.helix;
  };

  # config

  editor = {
      lsp.display-messages = true;
    };
  programs.helix.languages = {
    language-server = {
      jdtls = {
        command = "${pkgs.jdt-language-server}/bin/jdtls";
        args = [
          "-data" "/home/${config.home.username}/.cache/jdtls/workspace"
        ];
      };
    };
    java = {
      auto-format = true
    }
  };
}
