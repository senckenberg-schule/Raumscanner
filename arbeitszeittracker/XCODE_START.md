# Start in Xcode – Schritt für Schritt

Ziel: Die App läuft im iPhone-Simulator und auf deinem eigenen iPhone.
Der Quellcode liegt in `ios-quellcode/`. Er wurde ohne Mac geschrieben und noch nie kompiliert.
Fehlermeldungen beim ersten Bauen sind normal: einfach kopieren und an Claude schicken.

## 1. Xcode vorbereiten (einmalig)

1. **Xcode** aus dem Mac App Store installieren bzw. aktualisieren (aktuelle Version).
2. Xcode einmal öffnen. Wenn es fragt, die **iOS-Plattform** (Simulator) mit herunterladen.
3. **Apple-ID hinzufügen:** Xcode → *Settings…* → *Accounts* → unten **+** → *Apple ID* → anmelden.
   Ein kostenloser Account reicht zum Testen auf dem eigenen iPhone. Den bezahlten Developer-Account brauchst du erst für TestFlight und den App Store.

## 2. Projekt von GitHub holen

Im **Terminal** (Programme → Dienstprogramme → Terminal):

```bash
cd ~/Documents
git clone https://github.com/senckenberg-schule/Raumscanner.git
cd Raumscanner
git checkout claude/arbeitszeittracker-backlog
```

Fragt Git nach Benutzername und Passwort: Als Passwort brauchst du ein GitHub-Token. Alternativ installierst du **GitHub Desktop** und klonst das Repo dort (Branch `claude/arbeitszeittracker-backlog` auswählen).

## 3. Neues Xcode-Projekt anlegen

1. Xcode → *File* → *New* → *Project…* → **iOS** → **App** → *Next*.
2. Ausfüllen:
   - **Product Name:** `Arbeitszeit`
   - **Team:** dein Name (Personal Team)
   - **Organization Identifier:** z. B. `de.deinname`
   - **Interface:** SwiftUI · **Language:** Swift
   - **Storage:** None (die Datenbank bringt unser Code selbst mit)
   - **Testing System:** Swift Testing
3. *Next* → Speicherort: den Ordner **`Raumscanner/arbeitszeittracker`** wählen.
   **Haken bei „Create Git repository on my Mac“ entfernen** (wir sind schon in einem Git-Repo).
4. *Create*.

## 4. Unseren Code einsetzen

1. Links in Xcode (Projekt-Navigator) im Ordner **Arbeitszeit** die Dateien
   `ArbeitszeitApp.swift` und `ContentView.swift` auswählen → Rechtsklick → *Delete* → **Move to Trash**.
2. Im **Finder** den Ordner `Raumscanner/arbeitszeittracker/ios-quellcode` öffnen.
3. Dessen Inhalt (`ArbeitszeitApp.swift` und die Ordner `Ansichten`, `Logik`, `Modelle`) mit der Maus
   in Xcode auf den Ordner **Arbeitszeit** ziehen.
4. Im Dialog: **Copy files to destination** bzw. *Copy items if needed* anhaken, Target **Arbeitszeit** angehakt → *Finish*.
5. Projekt (blaues Symbol ganz oben) → Target **Arbeitszeit** → *General* → **Minimum Deployments: iOS 26.0**
   (wir nutzen den Glas-Effekt von iOS 26/27).

## 5. Im Simulator starten

1. Oben in der Mitte als Ziel ein Gerät wählen, z. B. **iPhone 17**.
2. **⌘R** drücken (oder das Play-Dreieck).
3. Fehler? Links das Warndreieck-Symbol (⌘5) öffnen, die **roten Meldungen** kopieren und an Claude schicken.

## 6. Auf dem eigenen iPhone

1. iPhone per Kabel anschließen, auf dem iPhone **„Vertrauen“** tippen.
2. Auf dem iPhone: *Einstellungen* → *Datenschutz & Sicherheit* → **Entwicklermodus** einschalten (iPhone startet neu).
3. In Xcode oben dein iPhone als Ziel wählen → **⌘R**.
4. Beim ersten Mal auf dem iPhone: *Einstellungen* → *Allgemein* → *VPN und Geräteverwaltung* → deinem Entwicklerprofil vertrauen.

Mit kostenlosem Account läuft die App 7 Tage, danach einfach erneut mit ⌘R installieren.

## 7. Stand zurück zu GitHub

Damit Claude in der Cloud am echten Projekt weiterarbeiten kann:

```bash
cd ~/Documents/Raumscanner
git add arbeitszeittracker/Arbeitszeit
git commit -m "Xcode-Projekt angelegt"
git push
```

Danach liegt das Xcode-Projekt im Repo. Den Ordner `ios-quellcode/` räumen wir dann auf.

## Was die App in diesem Stand kann

- Onboarding: Bundesland, Schulform, Umfang, Wochenarbeitszeit
- **Heute:** Tagesring nach Tätigkeiten, Schnellstart mit einem Tipp, laufender Timer als Glas-Leiste,
  Einträge mit Wischen löschen, manueller Eintrag über „Hinzufügen“
- **Woche:** Ist, Soll bis heute, Differenz und Balkendiagramm mit Soll-Linie
- **Einstellungen:** alle Werte änderbar, alle Daten löschen
- Der Timer läuft weiter, auch wenn die App geschlossen wird
- Badges sind noch ein Platzhalter
