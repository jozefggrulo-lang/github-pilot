#!/bin/bash
echo "[+] Kontrola git statusu a automatický push na GitHub..."
git add .
read -p "Zadaj správu pre commit (alebo stlač Enter pre default): " msg
if [ -z "$msg" ]; then
  msg="Auto-update scripts $(date +'%Y-%m-%d %H:%M')"
fi
git commit -m "$msg"
git push origin $(git rev-parse --abbrev-ref HEAD)
echo "[+] Úspešne synchronizované s GitHubom!"
