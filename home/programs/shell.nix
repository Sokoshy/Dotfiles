{
   programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      #bitwarden ssh
      export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
    '';
  };
}
