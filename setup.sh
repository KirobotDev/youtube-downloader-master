#!/bin/bash
# ─── YouTube Downloader — Setup complet ──────────────────────────────────────
set -e

echo "🎬 Installation de YouTube Downloader..."
echo ""

# 1. Mise à jour des paquets
echo "📦 Mise à jour des paquets..."
sudo apt update -y

# 2. Installer ffmpeg
echo "🎞️  Installation de ffmpeg..."
sudo apt install -y ffmpeg

# 3. Installer pip si absent
if ! command -v pip3 &> /dev/null; then
  echo "🐍 Installation de pip..."
  sudo apt install -y python3-pip
fi

# 4. Installer yt-dlp
echo "⬇️  Installation de yt-dlp..."
pip3 install --break-system-packages yt-dlp 2>/dev/null || pip3 install yt-dlp

# 5. Installer les dépendances Node.js
echo "📦 Installation des dépendances Node.js..."
npm install

# 6. Vérification
echo ""
echo "✅ Vérification des installations :"
echo "   Node.js  : $(node --version)"
echo "   npm      : $(npm --version)"
echo "   yt-dlp   : $(yt-dlp --version 2>/dev/null || echo 'NON INSTALLÉ ❌')"
echo "   ffmpeg   : $(ffmpeg -version 2>&1 | head -1 || echo 'NON INSTALLÉ ❌')"
echo ""
echo "🚀 Tout est prêt ! Lance le serveur avec :"
echo "   npm start"
echo ""
echo "   → http://localhost:3000"
