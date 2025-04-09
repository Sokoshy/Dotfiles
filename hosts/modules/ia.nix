{ pkgs, ...}:
{
  services.open-webui.enable = true;
    services = {
      ollama = {
        enable = true;
        acceleration = "rocm";
        environmentVariables = {
          HSA_OVERRIDE_GFX_VERSION = "10.3.0";
        };
      };
    open-webui.enable = true;
  };
  # services.open-webui.enable = true;
}