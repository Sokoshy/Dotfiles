````md
# ❄️ NixOS Dotfiles

Configuration **NixOS modulaire** basée sur **flakes**, avec **Home Manager intégré**.  
Support multi-machines (laptop / desktop).

---

## ✨ Features

- Flake-based setup
- Configuration multi-host
- Home Manager intégré
- Modules NixOS réutilisables
- Dotfiles versionnés

---

## 🖥️ Hosts

| Host | Commande |
|------|----------|
| Laptop | `sudo nixos-rebuild switch --flake .#nixos-laptop` |
| Desktop | `sudo nixos-rebuild switch --flake .#nixos-desktop` |

---

## 📁 Structure

```text
hosts/        # Configuration NixOS
home/         # Home Manager
flake.nix     # Entrypoint
````

---

## 🚀 Build & activation

```bash
sudo nixos-rebuild switch --flake .#nixos-laptop
```

---

## 🔄 Mise à jour

```bash
nix flake update
sudo nixos-rebuild switch --flake .#nixos-laptop
```

---

## 🧪 Vérification

```bash
nix flake check
```

---

## ♻️ Rollback

```bash
sudo nixos-rebuild switch --rollback
```

## 💾 Backup /etc/nixos

```bash
sudo mv /etc/nixos /etc/nixos.backup
```
