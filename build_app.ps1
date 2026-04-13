$ErrorActionPreference = "Stop"

Write-Host "Nettoyage du dossier de build..."
if (Test-Path "out") {
    Remove-Item "out" -Recurse -Force
}

Write-Host "Construction de l'application via Electron Forge..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
cmd.exe /c npm run make

Write-Host "Build terminé ! Le .exe d'installation se trouve dans le sous-dossier 'out/make/squirrel.windows/x64'."
