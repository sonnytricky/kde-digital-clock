### KDE Plasma Widget


Wenn du dein KDE-Plasmoid auf GitHub verwalten, versionieren und für andere bereitstellen möchtest, kannst du das Projekt ganz einfach strukturieren und automatisieren.

---

### 1. Die Ordnerstruktur im Git-Repository

Lege dein lokalen Ordner für das Repository wie folgt an (die Namensgebung der Ordner unterscheidet sich leicht von den internen Installationspfaden, um eine saubere Repo-Struktur zu haben):

```text
kde-digital-clock/
├── .gitignore
├── README.md
├── LICENSE
├── package.json (optional, falls du Build-Tools nutzt)
└── package/
    ├── metadata.json
    └── contents/
        └── ui/
            └── main.qml

```

> **Wichtig:** Der Inhalt deines Plasmoids (die Datei `metadata.json` und der Ordner `contents/`) liegt im Repository üblicherweise in einem Unterordner namens **`package/`**.

---

### 2. Typische Dateien im Repository

#### `.gitignore`

Sorge dafür, dass temporäre Dateien oder Test-Sinks von Git ignoriert werden:

```text
*.kdev4
.idea/
.vscode/
*.kate-swp
*~
build/

```

#### `README.md`

Erstelle eine kurze Dokumentation mit Installationsanweisungen für andere Nutzer:

```markdown
# Meine Digitale Uhr (KDE Plasma Widget)

Ein einfaches digitales Uhr-Widget für KDE Plasma.

## Installation

### Manuell über das Terminal

1. Repository klonen:
   ```bash
   git clone [https://github.com/DEIN-BENUTZERNAME/kde-digital-clock.git](https://github.com/DEIN-BENUTZERNAME/kde-digital-clock.git)
   cd kde-digital-clock

```

2. Widget installieren:
```bash
kpackagetool5 -t Plasma/Applet -i package/

```


*(Falls du Plasma 6 nutzt: `kpackagetool6 -t Plasma/Applet -i package/`)*
3. Widget aktualisieren (nach Änderungen):
```bash
kpackagetool5 -t Plasma/Applet -r package/

```



## Testen

Du kannst das Widget in einem Vorschaufenster testen:

```bash
plasmoidviewer -p package/

```

```

---

### 3. Repository lokal initialisieren und auf GitHub pushen

Führe in deinem Projektordner (`kde-digital-clock`) folgende Schritte im Terminal aus:

1. **Git initialisieren:**
   ```bash
   git init
   git branch -M main

```

2. **Dateien hinzufügen und ersten Commit erstellen:**
```bash
git add .
git commit -m "Initialer Commit: Digitale Uhr für KDE Plasma"

```


3. **Mit GitHub verbinden und pushen:**
Erstelle auf GitHub ein neues leeres Repository (z. B. `kde-digital-clock`) und verbinde es:
```bash
git remote add origin https://github.com/DEIN-BENUTZERNAME/kde-digital-clock.git
git push -u origin main

```



---

### 4. Nützlicher Workflow während der Entwicklung

Damit du Änderungen aus deinem Repository direkt in KDE testen kannst, kannst du dir ein kleines Shell-Skript (z. B. `dev-install.sh`) in das Wurzelverzeichnis legen:

```bash
#!/bin/bash
# Reinstalliert das Widget lokal zum Testen

kpackagetool5 -t Plasma/Applet -r package/ 2>/dev/null || true
kpackagetool5 -t Plasma/Applet -i package/
plasmoidviewer -p package/

```

Mach es mit `chmod +x dev-install.sh` ausführbar. Danach kannst du mit `./dev-install.sh` deine Änderungen in einem Schritt aktualisieren und die Vorschau öffnen.