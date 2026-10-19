# TP2 - Sauvegarde PowerShell

Script de sauvegarde avec journalisation, paramètres et compression.

## Utilisation

```powershell
.\sauvegarde.ps1 -Source "C:\Donnees"
```

Le dossier source doit exister. Le compte doit pouvoir écrire dans la destination.

Ajouter `-Compression` pour créer également une archive ZIP.
