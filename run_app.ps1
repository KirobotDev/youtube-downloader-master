$ErrorActionPreference = "Continue"

Write-Host "Lancement de l'application en mode développement..."
$nodeDir = "node-v20.11.1-win-x64"

if (-not (Test-Path $nodeDir)) {
    Write-Host "Veuillez d'abord exécuter build_app.ps1 une fois pour télécharger l'environnement Node.js." -ForegroundColor Red
    exit
}

$env:Path = "$PWD\$nodeDir;" + $env:Path

# Important : On retire cette variable d'environnement qui force Electron à agir comme Node
if (Test-Path Env:\ELECTRON_RUN_AS_NODE) {
    Remove-Item Env:\ELECTRON_RUN_AS_NODE
}

npm start
