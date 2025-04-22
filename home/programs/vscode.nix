{ pkgs, ...}:
{
    programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [
    sqlite
    # Ajoutez ici d'autres paquets dont VS Code ou vos extensions pourraient avoir besoin dans l'environnement FHS
  ]);
  };
}