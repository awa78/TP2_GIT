param(
    [string]$Source = (Join-Path $PSScriptRoot "donnees")
)
$ErrorActionPreference = "Stop"
$Destination = "E:\Backup"
if (-not (Test-Path -LiteralPath $Source -PathType Container)) {
    throw "Le dossier source est introuvable : $Source"
}
$DossierJournal = Join-Path $PSScriptRoot "logs"
New-Item -ItemType Directory -Path $DossierJournal -Force | Out-Null
$Journal = Join-Path $DossierJournal "sauvegarde.log"
Add-Content -LiteralPath $Journal -Value "$(Get-Date -Format o) DEBUT source=$Source destination=$Destination"
$NomSauvegarde = "sauvegarde-" + (Get-Date -Format "yyyyMMdd-HHmmss-fff")
$Cible = Join-Path $Destination $NomSauvegarde
New-Item -ItemType Directory -Path $Cible -Force | Out-Null
Get-ChildItem -LiteralPath $Source -Force | Copy-Item -Destination $Cible -Recurse -Force
Add-Content -LiteralPath $Journal -Value "$(Get-Date -Format o) FIN cible=$Cible"
