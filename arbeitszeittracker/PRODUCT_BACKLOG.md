# Product Backlog – Arbeitszeittracker für Lehrkräfte (iOS)

Stand: 2026-10-08 · Version 0.1 (Entwurf zur Abstimmung)

## 1. Produktvision

> Für Lehrkräfte, die ihre tatsächliche Arbeitszeit (Unterricht, Vor-/Nachbereitung, Korrekturen, Konferenzen, Aufsichten …) realistisch erfassen wollen, ist der **Arbeitszeittracker** eine iOS-App, die Zeiten mit minimalem Aufwand erfasst, auf die Besonderheiten des Schuljahres (Unterrichtsstunden, Ferien, Deputat) eingeht und aussagekräftige Auswertungen liefert – **ohne Cloud-Zwang und ohne Schülerdaten**.

**Nutzen:** Transparenz über die eigene Belastung, Nachweis von Mehrarbeit, Grundlage für Gespräche mit Schulleitung/Personalrat, bessere Selbststeuerung (Work-Life-Balance).

## 2. Personas

| Persona | Beschreibung | Kernbedürfnis |
|---|---|---|
| **Lena, 29, Gymnasiallehrerin (Vollzeit)** | Viel Korrektur, Klassenleitung | Schnell erfassen zwischen zwei Stunden; Wochenübersicht |
| **Markus, 47, Teilzeit (75 %)** | Deputat < Vollzeit, Funktionsstelle | Soll/Ist-Abgleich mit seinem Deputat, Mehrarbeit sichtbar |
| **Sabine, 38, Referendarin** | Seminar, Ausbildungsunterricht, Besuche | Verschiedene Zeitarten; Export für Seminarleitung |

## 3. Annahmen (bitte bestätigen)

- Plattform: **iOS (iPhone zuerst)**, Swift/SwiftUI, iOS 17+, iPad später.
- Datenhaltung: **lokal auf dem Gerät** (SwiftData), optional iCloud-Sync später.
- Kontext: Deutschland (Bundesland-spezifische Regeln und Ferien als späteres Feature).
- Keine Schüler-/Klassenpersonendaten → DSGVO-Risiko minimal.
- Einzelnutzer-App, keine Schulverwaltungsanbindung im MVP.
- Rein Deutsch im MVP, Lokalisierung später.

## 4. Epics

| ID | Epic | Ziel |
|---|---|---|
| E1 | Zeiterfassung | Zeiten schnell und fehlerarm festhalten |
| E2 | Kategorien & Tätigkeiten | Lehrer-spezifische Zeitarten abbilden |
| E3 | Soll-Arbeitszeit & Deputat | Ist gegen Soll vergleichen |
| E4 | Auswertung & Statistik | Erkenntnisse aus den Daten |
| E5 | Export & Nachweis | Daten weitergeben (PDF/CSV) |
| E6 | Schuljahreskontext | Ferien, Schuljahre, Stundenplan |
| E7 | Erinnerungen & Komfort | Widgets, Live Activity, Siri, Benachrichtigungen |
| E8 | Datenschutz, Sicherheit, Backup | Vertrauen und Datensicherheit |
| E9 | Onboarding, Einstellungen, Qualität | Erster Eindruck, Barrierefreiheit, Stabilität |

## 5. Priorisiertes Backlog

Schätzung in Story Points (Fibonacci). Priorität: **M** = Must (MVP), **S** = Should, **C** = Could, **W** = Won't (jetzt nicht).

| ID | Epic | User Story | Prio | SP |
|---|---|---|---|---|
| US-01 | E1 | Als Lehrkraft möchte ich per **Start/Stopp-Timer** eine Tätigkeit erfassen, damit ich Zeiten ohne Nachdenken festhalte. | M | 5 |
| US-02 | E1 | Als Lehrkraft möchte ich Zeiten **nachträglich manuell eintragen** (Datum, Start, Ende/Dauer), weil ich nicht immer den Timer starte. | M | 5 |
| US-03 | E1 | Als Lehrkraft möchte ich Einträge **bearbeiten und löschen**, um Fehler zu korrigieren. | M | 3 |
| US-04 | E2 | Als Lehrkraft möchte ich Einträge einer **Kategorie** zuordnen (Unterricht, Vorbereitung, Korrektur, Konferenz, Aufsicht, Elterngespräche, Fahrten/Ausflüge, Verwaltung, Fortbildung, Sonstiges). | M | 5 |
| US-05 | E2 | Als Lehrkraft möchte ich eigene Kategorien anlegen, umbenennen, farblich markieren und archivieren. | S | 5 |
| US-06 | E1 | Als Lehrkraft möchte ich zu einem Eintrag eine **optionale Notiz** hinzufügen (z. B. „Klausur 10b korrigiert“). | S | 2 |
| US-07 | E4 | Als Lehrkraft möchte ich eine **Tages- und Wochenübersicht** sehen (Summe, Verteilung nach Kategorie). | M | 5 |
| US-08 | E3 | Als Lehrkraft möchte ich meine **Soll-Arbeitszeit** (Wochenstunden bzw. Deputat/Teilzeitanteil) hinterlegen, damit die App Ist und Soll vergleicht. | M | 5 |
| US-09 | E3 | Als Lehrkraft möchte ich sehen, wie viel **Mehr-/Minderarbeit** ich in Woche/Monat/Schuljahr habe. | S | 5 |
| US-10 | E1 | Als Lehrkraft möchte ich, dass der **laufende Timer** auch bei App-Schließung/Neustart weiterläuft, damit nichts verloren geht. | M | 3 |
| US-11 | E1 | Als Lehrkraft möchte ich **Unterrichtsstunden in 45-Min-Einheiten** erfassen können (z. B. „2 Stunden“), da ich in Schulstunden denke. | S | 3 |
| US-12 | E4 | Als Lehrkraft möchte ich eine **Monats- und Schuljahresauswertung** mit Diagrammen (Swift Charts). | S | 8 |
| US-13 | E5 | Als Lehrkraft möchte ich meine Daten als **CSV exportieren**, um sie in Excel weiterzuverarbeiten. | S | 3 |
| US-14 | E5 | Als Lehrkraft möchte ich einen **PDF-Nachweis** für einen Zeitraum erzeugen und teilen (Share Sheet). | S | 8 |
| US-15 | E8 | Als Lehrkraft möchte ich, dass alle Daten **lokal gespeichert** werden und die App ohne Account funktioniert. | M | 2 |
| US-16 | E8 | Als Lehrkraft möchte ich die App per **Face ID / Code** sperren können. | C | 3 |
| US-17 | E8 | Als Lehrkraft möchte ich ein **Backup/Restore** (Datei-Export/Import), um bei Gerätewechsel nichts zu verlieren. | S | 5 |
| US-18 | E8 | Als Lehrkraft möchte ich optional **iCloud-Sync** zwischen iPhone und iPad. | C | 13 |
| US-19 | E7 | Als Lehrkraft möchte ich **Widgets** (Startbildschirm/Sperrbildschirm) mit Start/Stopp und Wochensumme. | S | 8 |
| US-20 | E7 | Als Lehrkraft möchte ich eine **Live Activity** für den laufenden Timer. | C | 5 |
| US-21 | E7 | Als Lehrkraft möchte ich **Erinnerungen** („Heute noch nichts erfasst“, „Timer läuft seit 4 h“). | S | 3 |
| US-22 | E7 | Als Lehrkraft möchte ich Timer per **Siri/Kurzbefehle** starten und stoppen. | C | 5 |
| US-23 | E6 | Als Lehrkraft möchte ich **Schuljahre** anlegen, damit Auswertungen pro Schuljahr möglich sind. | S | 5 |
| US-24 | E6 | Als Lehrkraft möchte ich **Ferien/Feiertage** (nach Bundesland) berücksichtigt haben, damit das Soll realistisch ist. | C | 8 |
| US-25 | E6 | Als Lehrkraft möchte ich meinen **Stundenplan** hinterlegen und Unterricht daraus automatisch vorschlagen lassen. | C | 13 |
| US-26 | E6 | Als Lehrkraft möchte ich **Vorlagen für wiederkehrende Tätigkeiten** (z. B. Dienstbesprechung Mi 14:30, 90 min). | C | 8 |
| US-27 | E9 | Als neue Nutzerin möchte ich ein **kurzes Onboarding** (Soll-Arbeitszeit, Kategorien) und danach sofort loslegen. | S | 5 |
| US-28 | E9 | Als Nutzer mit Sehbehinderung möchte ich **VoiceOver, Dynamic Type und Dark Mode** nutzen. | M | 3 |
| US-29 | E9 | Als Lehrkraft möchte ich **Pausen** erfassen/abziehen, damit die Netto-Arbeitszeit stimmt. | C | 3 |
| US-30 | E4 | Als Lehrkraft möchte ich **Zeiträume filtern/durchsuchen** (Kategorie, Notiztext). | C | 5 |
| US-31 | E9 | Als Lehrkraft möchte ich die App auf **iPad** nutzen (angepasstes Layout). | W | 8 |
| US-32 | E9 | Als Lehrkraft möchte ich die App **auf Englisch** nutzen. | W | 3 |
| US-33 | E5 | Als Lehrkraft möchte ich Daten an **Schulleitung/Personalrat** direkt übermitteln. | W | 21 |

## 6. Vorschlag MVP (Release 1.0)

Ziel: In ~3–4 Sprints (je 2 Wochen) eine App, die man im Schulalltag **wirklich benutzen** kann.

**Enthalten:** US-01, 02, 03, 04, 07, 08, 10, 15, 28 → **ca. 36 SP**

**Direkt danach (Release 1.1):** US-06, 09, 11, 13, 17, 21, 27

**Release 1.2+:** Auswertungen, PDF, Widgets, Schuljahre

## 7. Vorschlag Sprint-Plan

| Sprint | Sprintziel | Stories |
|---|---|---|
| **0** | Setup: Xcode-Projekt, SwiftData-Modell, CI/TestFlight, Design-Skizzen | – |
| **1** | „Ich kann Zeit erfassen“ | US-01, 02, 03, 10, 15 |
| **2** | „Ich sehe, was ich getan habe“ | US-04, 07, 28 |
| **3** | „Ich sehe, wie ich zum Soll stehe“ → **MVP-TestFlight** | US-08 (+ Puffer, Bugfixes) |

## 8. Beispiel-Akzeptanzkriterien (Top-Stories)

**US-01 Timer**
- Gegeben keine laufende Erfassung, wenn ich eine Kategorie antippe, dann startet ein Timer und wird prominent angezeigt.
- Wenn ich „Stopp“ tippe, wird ein Eintrag mit Start, Ende, Dauer und Kategorie gespeichert.
- Es kann immer nur ein Timer gleichzeitig laufen; ein Start eines zweiten beendet den ersten (mit Hinweis).

**US-02 Manueller Eintrag**
- Datum, Startzeit und Endzeit (oder Dauer) sind Pflicht; Ende liegt nach Start.
- Überlappende Einträge erzeugen eine Warnung, kein Hard-Block.

**US-08 Soll-Arbeitszeit**
- Ich kann Wochenstunden (z. B. 40 h) und Teilzeitanteil (z. B. 75 %) eingeben.
- Die Wochenübersicht zeigt Ist, Soll und Differenz.

**US-10 Timer-Persistenz**
- Nach Beenden der App und Neustart läuft der Timer mit korrekter Dauer weiter (Startzeitstempel wird gespeichert, nicht ein Zähler).

## 9. Definition of Done

- Akzeptanzkriterien erfüllt und vom Product Owner abgenommen
- Unit-Tests für Logik (Zeitberechnung, Soll/Ist), UI-Smoke-Test für Kernfluss
- Keine Compiler-Warnungen, SwiftLint sauber
- VoiceOver- und Dynamic-Type-Check für neue Screens
- Läuft auf aktuellem iPhone-Simulator und mindestens einem echten Gerät
- Per TestFlight verteilbar

## 10. Risiken & offene Fragen

| # | Frage / Risiko |
|---|---|
| 1 | **Rechtlicher Rahmen:** Soll die App nur persönliches Tagebuch sein oder auch als Nachweis gegenüber dem Dienstherrn taugen? (beeinflusst Revisionssicherheit/Export) |
| 2 | **Bundesland:** Gibt es eine Zielregion (z. B. Hessen) mit eigenen Regeln zu Pflichtstunden/Arbeitszeitmodell? |
| 3 | **Zielgruppe:** Nur du selbst, Kollegium, oder App Store für alle? (Impressum, Datenschutzerklärung, Apple-Developer-Account nötig) |
| 4 | **Monetarisierung:** Kostenlos, einmaliger Kauf, Abo? |
| 5 | **Tech-Stack:** Native Swift/SwiftUI (empfohlen) vs. Cross-Platform – Entwicklung hier in der Cloud-Umgebung kann kein iOS-Build ausführen (kein Xcode/macOS). |
| 6 | **Android/Web** relevant? |

## 11. Nächste Schritte

1. Backlog gemeinsam sichten, Prioritäten und Annahmen korrigieren
2. Offene Fragen (Abschnitt 10) klären
3. MVP-Umfang und Sprint 1 verbindlich festlegen (Sprint Planning)
4. Sprint 0: Projektstruktur und Entwurfs-Wireframes
