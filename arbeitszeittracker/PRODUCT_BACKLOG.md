# Product Backlog – Arbeitszeittracker für Lehrkräfte (iOS)

Stand: 2026-10-08 · Version 0.3

## Änderungen gegenüber v0.1

| Entscheidung (Product Owner) | Auswirkung im Backlog |
|---|---|
| Ziel: **App Store**, später ggf. **alternative App-Marktplätze** (EU) | Neues Epic **E10 Veröffentlichung & Rechtliches** (Datenschutzerklärung, Privacy Manifest, Store-Auftritt …) |
| Zweck: **persönliches Zeittagebuch** (vorerst kein Nachweis) | Export bleibt „Should“, keine Revisionssicherheit; neue Tagebuch-Funktionen (Belastungsempfinden) |
| **Bundesland und Schulform auswählbar** | Neues Epic **E11 Bundesland & Schulform** inkl. Recherche-Spike, Ferien/Feiertage werden wichtiger |
| Widgets früh ermöglichen (v0.3) | Neuer Enabler TE-08 (App Group + App Intents) in Sprint 1; US-19 Widgets ✏️ nach Release 1.1 vorgezogen |
| PO bittet um Ergänzungen | Neue Stories US-34 bis US-63, Technische Enabler und Spikes, MVP angepasst, technische Enabler ergänzt |

## 1. Produktvision

> Für Lehrkräfte, die ihre tatsächliche Arbeitszeit realistisch erfassen wollen, ist der **Arbeitszeittracker** ein persönliches Zeittagebuch für iPhone. Es erfasst Zeiten mit minimalem Aufwand, kennt die Besonderheiten des Schuljahres (Bundesland, Schulform, Pflichtstunden, Ferien) und zeigt verständliche Auswertungen. Alle Daten bleiben auf dem Gerät: ohne Account, ohne Tracking und ohne Schülerdaten.

**Nutzen:** Transparenz über die eigene Belastung, bessere Selbststeuerung (Work-Life-Balance) und eine Grundlage für Gespräche mit Schulleitung oder Personalrat.

## 2. Personas

| Persona | Beschreibung | Kernbedürfnis |
|---|---|---|
| **Lena, 29, Gymnasium, Hessen, Vollzeit** | Viel Korrektur, Klassenleitung | Schnell zwischen zwei Stunden erfassen; Wochenübersicht |
| **Markus, 47, Gesamtschule, NRW, Teilzeit 75 %** | Funktionsstelle, Anrechnungsstunden | Soll/Ist passend zu Teilzeit und Ermäßigungen |
| **Sabine, 38, Grundschule, Bayern, Referendarin** | Seminar, Ausbildungsunterricht | Eigene Zeitarten; ehrlicher Blick auf die Belastung |

## 3. Rahmen und Annahmen

- **Plattform:** iPhone, Swift/SwiftUI, SwiftData, iOS 17+; iPad später.
- **Datenhaltung:** nur lokal, kein Server, kein Account. Optionaler iCloud-Sync läuft über die private iCloud der Nutzerin und nie über eigene Server.
- **Keine Drittanbieter-SDKs** für Analytics oder Werbung. Damit kann die App im Store mit „Keine Daten erfasst“ (Data Not Collected) gelistet werden.
- **Region:** Deutschland, alle 16 Bundesländer; Sprache zunächst Deutsch.
- **Rechtlicher Status:** persönliches Tagebuch. Alle Soll-Werte sind unverbindliche Orientierungswerte und können überschrieben werden; die App gibt einen klaren Hinweis „keine Rechtsberatung“.
- **Voraussetzungen außerhalb des Codes:** Apple-Developer-Account (kostenpflichtig, jährlich), ein Mac mit Xcode zum Bauen, Impressum und Datenschutzerklärung als Webseite.

## 4. Fachliche Besonderheiten (Hintergrund für das Team)

Bei Lehrkräften zählt nicht nur die Unterrichtszeit, deshalb braucht das Datenmodell diese Begriffe:

- **Pflichtstunden / Regelstundenmaß / Deputat:** wöchentliche Unterrichtsverpflichtung. Sie hängt von Bundesland und Schulform ab und wird teils nach Alter oder Funktion ermäßigt.
- **Anrechnungs- und Ermäßigungsstunden:** z. B. für Klassenleitung, Funktionsstellen, Schwerbehinderung oder Alter.
- **Gesamtarbeitszeit:** Für Beamtinnen gilt die Wochenarbeitszeit des Landesbeamtenrechts. Weil die Ferien den Urlaubsanspruch übersteigen, wird faktisch in Schulwochen mehr gearbeitet. Ein sinnvoller Soll/Ist-Vergleich braucht daher ein **Jahresarbeitszeitkonto** und nicht nur eine Wochenbetrachtung.
- **Ferien und Feiertage** unterscheiden sich je Bundesland und Schuljahr.
- **Kategorien** sollten sich an gängigen Arbeitszeitstudien orientieren, damit eigene Daten mit Studien vergleichbar sind: Unterricht, unterrichtsnahe Tätigkeiten, Kommunikation/Beratung, schulische Organisation/Funktionen, Fortbildung, Fahrten/Sonstiges.

> ⚠️ Die konkreten Werte (Pflichtstunden je Land und Schulform, Wochenarbeitszeit, Ferientermine) ändern sich regelmäßig. Sie werden **recherchiert, mit Quelle und Stand versioniert** als Datendatei gepflegt und nicht im Code festgeschrieben (siehe Spike SP-01).

## 5. Epics

| ID | Epic | Ziel |
|---|---|---|
| E1 | Zeiterfassung | Zeiten schnell und fehlerarm festhalten |
| E2 | Kategorien & Tätigkeiten | Lehrerspezifische Zeitarten abbilden |
| E3 | Soll-Arbeitszeit & Deputat | Ist gegen Soll vergleichen, auch über das Jahr |
| E4 | Auswertung & Statistik | Erkenntnisse aus den Daten gewinnen |
| E5 | Export & Datenportabilität | Eigene Daten mitnehmen (CSV, PDF, Backup) |
| E6 | Schuljahreskontext | Schuljahre, Ferien, Stundenplan, Abwesenheiten |
| E7 | Erinnerungen & Komfort | Widgets, Live Activity, Siri, Benachrichtigungen |
| E8 | Datenschutz & Sicherheit | Vertrauen: lokal, gesperrt, löschbar |
| E9 | Onboarding, UX & Qualität | Erster Eindruck, Barrierefreiheit, Stabilität |
| **E10** | **Veröffentlichung & Rechtliches** | Store-Reife für App Store und alternative Marktplätze |
| **E11** | **Bundesland & Schulform** | Länder- und schulformspezifische Vorgaben |
| **E12** | **Persönliches Tagebuch** | Reflexion und Belastungsempfinden |
| **TE** | **Technische Enabler** | Architektur, Tests, Datenmigration, CI |

## 6. Priorisiertes Backlog

Schätzung in Story Points (Fibonacci). Priorität: **M** = Must (MVP), **S** = Should, **C** = Could, **W** = Won't (vorerst nicht). Neue oder geänderte Einträge sind mit 🆕 bzw. ✏️ markiert.

### E1 Zeiterfassung
| ID | User Story | Prio | SP |
|---|---|---|---|
| US-01 | Als Lehrkraft möchte ich per **Start/Stopp-Timer** eine Tätigkeit erfassen, damit ich Zeiten ohne Nachdenken festhalte. | M | 5 |
| US-02 | Als Lehrkraft möchte ich Zeiten **nachträglich manuell eintragen** (Datum, Start, Ende oder Dauer). | M | 5 |
| US-03 | Als Lehrkraft möchte ich Einträge **bearbeiten und löschen**, um Fehler zu korrigieren. | M | 3 |
| US-06 | Als Lehrkraft möchte ich zu einem Eintrag eine **optionale Notiz** hinzufügen. | S | 2 |
| US-10 | Als Lehrkraft möchte ich, dass der **laufende Timer** auch nach Schließen oder Neustart der App korrekt weiterläuft. | M | 3 |
| US-11 | Als Lehrkraft möchte ich **Unterricht in Schulstunden** (45 Min., einstellbar) erfassen können. | S | 3 |
| US-29 | Als Lehrkraft möchte ich **Pausen** erfassen bzw. abziehen, damit die Netto-Arbeitszeit stimmt. | C | 3 |
| 🆕 US-34 | Als Lehrkraft möchte ich mit **„Schnellerfassung“** (zuletzt genutzte Kategorien, ein Tipp) starten, weil zwischen zwei Stunden nur Sekunden bleiben. | M | 3 |
| 🆕 US-35 | Als Lehrkraft möchte ich einen **vergessenen Timer korrigieren** („Timer läuft seit gestern – wann hast du aufgehört?“). | M | 3 |
| 🆕 US-36 | Als Lehrkraft möchte ich einen Eintrag **duplizieren** oder **„wie letzte Woche“** übernehmen, um wiederkehrende Arbeit schnell zu erfassen. | C | 3 |
| 🆕 US-37 | Als Lehrkraft möchte ich **Einträge über Mitternacht** (z. B. Klassenfahrt, Korrekturnacht) korrekt erfassen. | S | 2 |

### E2 Kategorien & Tätigkeiten
| ID | User Story | Prio | SP |
|---|---|---|---|
| ✏️ US-04 | Als Lehrkraft möchte ich Einträge einer **Kategorie** zuordnen. Voreinstellungen sind an Arbeitszeitstudien angelehnt: Unterricht, Vor-/Nachbereitung, Korrektur, Konferenz, Aufsicht/Vertretung, Eltern/Schülergespräche, Klassenfahrt/Exkursion, Organisation/Funktion, Fortbildung, Sonstiges. | M | 5 |
| US-05 | Als Lehrkraft möchte ich eigene Kategorien anlegen, umbenennen, einfärben, sortieren und archivieren. | S | 5 |
| 🆕 US-38 | Als Lehrkraft möchte ich Einträge zusätzlich mit **Fach und/oder Lerngruppe** versehen (z. B. „Mathe 10b“, ohne Schülernamen), um zu sehen, welche Klasse wie viel Zeit kostet. | S | 5 |
| 🆕 US-39 | Als Lehrkraft möchte ich, dass jede eigene Kategorie einer **Oberkategorie** zugeordnet ist, damit Auswertungen vergleichbar bleiben. | S | 3 |

### E3 Soll-Arbeitszeit & Deputat
| ID | User Story | Prio | SP |
|---|---|---|---|
| ✏️ US-08 | Als Lehrkraft möchte ich meine **Soll-Arbeitszeit** hinterlegen (Wochenarbeitszeit, Teilzeitanteil, Pflichtstunden). Werte aus Bundesland und Schulform werden vorgeschlagen und sind überschreibbar. | M | 5 |
| US-09 | Als Lehrkraft möchte ich sehen, wie viel **Mehr- oder Minderarbeit** ich in Woche, Monat und Schuljahr habe. | S | 5 |
| 🆕 US-40 | Als Lehrkraft möchte ich ein **Jahresarbeitszeitkonto**, das Ferien berücksichtigt, damit eine 50-Stunden-Schulwoche fair gegen ferienbedingte Minderzeiten gerechnet wird. | S | 8 |
| 🆕 US-41 | Als Lehrkraft möchte ich **Anrechnungs- und Ermäßigungsstunden** (Alter, Funktion, Klassenleitung, Schwerbehinderung) eintragen, damit mein Soll stimmt. | S | 5 |
| 🆕 US-42 | Als Lehrkraft möchte ich, dass sich **Soll-Werte zum Halbjahr oder Schuljahr ändern** können (z. B. neue Teilzeit), ohne dass alte Auswertungen falsch werden (historisierte Werte). | S | 5 |

### E4 Auswertung & Statistik
| ID | User Story | Prio | SP |
|---|---|---|---|
| US-07 | Als Lehrkraft möchte ich eine **Tages- und Wochenübersicht** sehen (Summe, Verteilung nach Kategorie, Soll/Ist). | M | 5 |
| US-12 | Als Lehrkraft möchte ich eine **Monats- und Schuljahresauswertung** mit Diagrammen (Swift Charts). | S | 8 |
| US-30 | Als Lehrkraft möchte ich nach **Kategorie, Lerngruppe oder Notiztext filtern und suchen**. | C | 5 |
| 🆕 US-43 | Als Lehrkraft möchte ich **Spitzenzeiten** erkennen (z. B. Zeugnis- und Klausurphasen, Wochenendarbeit, Arbeit nach 20 Uhr). | C | 5 |
| 🆕 US-44 | Als Lehrkraft möchte ich **Schulwochen und Ferienwochen getrennt** auswerten können. | S | 3 |

### E5 Export & Datenportabilität
| ID | User Story | Prio | SP |
|---|---|---|---|
| US-13 | Als Lehrkraft möchte ich meine Daten als **CSV exportieren**. | S | 3 |
| ✏️ US-14 | Als Lehrkraft möchte ich eine **PDF-Übersicht** für einen Zeitraum erzeugen und teilen (für Gespräche mit Schulleitung oder Personalrat, ohne Anspruch auf Beweiskraft). | C | 8 |
| US-17 | Als Lehrkraft möchte ich ein **Backup** exportieren und wieder importieren (z. B. bei Gerätewechsel). | S | 5 |

### E6 Schuljahreskontext
| ID | User Story | Prio | SP |
|---|---|---|---|
| US-23 | Als Lehrkraft möchte ich **Schuljahre** anlegen (automatisch passend zum Bundesland), damit Auswertungen pro Schuljahr möglich sind. | S | 5 |
| ✏️ US-24 | Als Lehrkraft möchte ich **Ferien und Feiertage meines Bundeslands** automatisch hinterlegt haben (offline mitgeliefert, manuell ergänzbar, z. B. bewegliche Ferientage der Schule). | S | 8 |
| US-25 | Als Lehrkraft möchte ich meinen **Stundenplan** (inkl. A/B-Wochen) hinterlegen und Unterricht daraus automatisch vorschlagen lassen. | C | 13 |
| US-26 | Als Lehrkraft möchte ich **Vorlagen für wiederkehrende Termine** (z. B. Dienstbesprechung Mi 14:30, 90 Min.). | C | 8 |
| 🆕 US-45 | Als Lehrkraft möchte ich **Abwesenheiten** (Krankheit, Sonderurlaub, Elternzeit) eintragen, damit sie das Soll korrekt mindern. | S | 5 |
| 🆕 US-46 | Als Lehrkraft an **mehreren Schulen** (Abordnung) möchte ich Einträge einer Schule zuordnen. | C | 5 |

### E7 Erinnerungen & Komfort
| ID | User Story | Prio | SP |
|---|---|---|---|
| ✏️ US-19 | Als Lehrkraft möchte ich **Widgets** (Home- und Sperrbildschirm) mit Start/Stopp und Wochensumme. Vorgezogen nach Release 1.1, baut auf TE-08 auf. | S | 8 |
| US-20 | Als Lehrkraft möchte ich eine **Live Activity / Dynamic Island** für den laufenden Timer. | C | 5 |
| US-21 | Als Lehrkraft möchte ich **Erinnerungen** („Heute noch nichts erfasst“, „Timer läuft seit 4 h“), abschaltbar, mit Ruhezeiten. | S | 3 |
| US-22 | Als Lehrkraft möchte ich Timer per **Siri/Kurzbefehle (App Intents)** starten und stoppen. | C | 5 |
| 🆕 US-47 | Als Lehrkraft möchte ich per **Steuerelement im Kontrollzentrum** bzw. über die **Action-Taste** den Timer starten. | C | 3 |
| 🆕 US-48 | Als Lehrkraft möchte ich den Timer auf der **Apple Watch** bedienen. | W | 13 |

### E8 Datenschutz & Sicherheit
| ID | User Story | Prio | SP |
|---|---|---|---|
| US-15 | Als Lehrkraft möchte ich, dass alle Daten **lokal** gespeichert werden und die App **ohne Account** funktioniert. | M | 2 |
| US-16 | Als Lehrkraft möchte ich die App per **Face ID / Gerätecode** sperren können. | S | 3 |
| US-18 | Als Lehrkraft möchte ich optional **iCloud-Sync** zwischen iPhone und iPad. | C | 13 |
| 🆕 US-49 | Als Lehrkraft möchte ich **alle meine Daten mit einem Schritt löschen** können (mit Sicherheitsabfrage). | M | 1 |
| 🆕 US-50 | Als Lehrkraft möchte ich in der App einen Hinweis sehen, **keine Schülernamen** in Notizen einzutragen (Datenschutz an Schulen). | S | 1 |

### E9 Onboarding, UX & Qualität
| ID | User Story | Prio | SP |
|---|---|---|---|
| ✏️ US-27 | Als neue Nutzerin möchte ich ein **kurzes Onboarding**: Bundesland, Schulform, Beschäftigungsumfang, fertig. Alles ist überspringbar und später änderbar. | M | 5 |
| US-28 | Als Nutzer mit Einschränkungen möchte ich **VoiceOver, Dynamic Type, Dark Mode** und ausreichende Kontraste. | M | 3 |
| US-31 | Als Lehrkraft möchte ich die App auf dem **iPad** nutzen. | W | 8 |
| US-32 | Als Lehrkraft möchte ich die App **auf Englisch** nutzen (Texte von Anfang an in String Catalogs). | W | 3 |
| 🆕 US-51 | Als Nutzerin möchte ich **Feedback oder Fehler** direkt aus der App per Mail senden (ohne Tracking). | S | 1 |
| 🆕 US-52 | Als Nutzerin möchte ich einen **Hilfe- und FAQ-Bereich** (z. B. „Wie rechnet die App mein Soll?“). | S | 3 |

### E10 Veröffentlichung & Rechtliches 🆕
| ID | User Story | Prio | SP |
|---|---|---|---|
| 🆕 US-53 | Als Anbieter brauche ich eine **Datenschutzerklärung und ein Impressum** (Webseite und in der App verlinkt), damit die App veröffentlicht werden darf. | M | 3 |
| 🆕 US-54 | Als Anbieter brauche ich ein **Privacy Manifest** (PrivacyInfo.xcprivacy) und korrekte **App-Datenschutzangaben** in App Store Connect. | M | 2 |
| 🆕 US-55 | Als Anbieter brauche ich einen **Store-Auftritt**: Name, Icon, Screenshots, Beschreibung, Keywords, Support-URL, Altersfreigabe, Barrierefreiheitsangaben. | S | 5 |
| 🆕 US-56 | Als Nutzerin möchte ich einen **Haftungshinweis**, dass Soll-Werte unverbindlich sind und keine Rechtsberatung darstellen. | M | 1 |
| 🆕 US-57 | Als Anbieter möchte ich ein **Monetarisierungsmodell** festlegen (z. B. kostenlos, Einmalkauf, Freemium mit Pro-Funktionen über StoreKit). | C | 8 |
| 🆕 US-58 | Als Anbieter möchte ich die App zusätzlich über **alternative App-Marktplätze in der EU** anbieten. | W | 13 |

### E11 Bundesland & Schulform 🆕
| ID | User Story | Prio | SP |
|---|---|---|---|
| 🆕 US-59 | Als Lehrkraft möchte ich **Bundesland und Schulform auswählen**, damit die App passende Vorgaben verwendet. | M | 3 |
| 🆕 US-60 | Als Lehrkraft möchte ich, dass für meine Auswahl **Pflichtstunden und Wochenarbeitszeit vorgeschlagen** werden, mit Quelle und Stand angezeigt. | S | 5 |
| 🆕 US-61 | Als Anbieter möchte ich die Länderdaten **ohne App-Update aktualisieren** können (z. B. signierte JSON-Datei; datenschutzfreundlich ohne Nutzerkennung). | C | 8 |

### E12 Persönliches Tagebuch 🆕
| ID | User Story | Prio | SP |
|---|---|---|---|
| 🆕 US-62 | Als Lehrkraft möchte ich pro Tag mein **Belastungsempfinden** (z. B. 1–5) und eine kurze Notiz festhalten, um Zusammenhänge zu erkennen. | C | 3 |
| 🆕 US-63 | Als Lehrkraft möchte ich einen **Wochenrückblick** („Diese Woche 46 h, davon 9 h am Wochenende“) als Benachrichtigung oder Ansicht. | C | 3 |

### TE Technische Enabler 🆕
| ID | Enabler | Prio | SP |
|---|---|---|---|
| TE-01 | Projektsetup: Xcode-Projekt, Ordnerstruktur, SwiftLint, Git-Workflow | M | 3 |
| TE-02 | Datenmodell (SwiftData) mit **Schema-Versionierung und Migrationsplan** von Anfang an | M | 5 |
| TE-03 | Zeitlogik als **eigenständig testbares Modul** (Swift Package): Dauer, Soll/Ist, Sommerzeit, Mitternacht | M | 5 |
| TE-04 | CI (z. B. Xcode Cloud oder GitHub Actions mit macOS-Runner): Build und Tests bei jedem Push | S | 5 |
| TE-05 | TestFlight-Verteilung für Testlehrkräfte | S | 2 |
| TE-06 | Crash- und Performance-Daten nur über Apple (App Store Connect / MetricKit), keine Dritt-SDKs | S | 1 |
| TE-07 | Alle Texte in String Catalogs (bereitet Lokalisierung vor) | M | 1 |
| 🆕 TE-08 | **Widget-Fähigkeit vorbereiten:** Datenspeicher in einer App Group (gemeinsam für App und Widget-Extension), Start/Stopp des Timers als App Intents. Grundlage für US-19, 20, 22, 47 | M | 2 |

### Spikes (Recherche, zeitlich begrenzt) 🆕
| ID | Fragestellung | Timebox |
|---|---|---|
| SP-01 | **Länderdaten:** Pflichtstunden je Bundesland × Schulform, Wochenarbeitszeit, Ermäßigungsregeln; Quellen (Verordnungen der Länder, KMK-Übersichten) und Pflegeprozess | 2 Tage |
| SP-02 | **Ferien und Feiertage:** Bezugsquelle (z. B. KMK-Ferienkalender), Lizenz, Offline-Format, Aktualisierung | 1 Tag |
| SP-03 | **Jahresarbeitszeitmodell:** Welche Rechenlogik ist fachlich vertretbar und verständlich? Abgleich mit veröffentlichten Arbeitszeitstudien | 1 Tag |
| SP-04 | **Alternative Marktplätze (EU):** Voraussetzungen, Gebühren, Aufwand gegenüber dem App Store | 0,5 Tage |
| SP-05 | **Name und Marke:** Verfügbarkeit des App-Namens im Store und Markenrecherche | 0,5 Tage |

## 7. MVP (Release 1.0): ein persönliches Zeittagebuch, das man im Schulalltag wirklich benutzt

| Bereich | Stories |
|---|---|
| Erfassen | US-01, 02, 03, 10, 34, 35 |
| Kategorien | US-04 |
| Kontext und Soll | US-27, 59, 08 (Werte zunächst manuell, Vorschläge folgen mit US-60) |
| Übersicht | US-07 |
| Datenschutz | US-15, 49 |
| Qualität | US-28, TE-01, 02, 03, 07, 08 |
| Store-Pflicht | US-53, 54, 56 |

**Umfang:** ca. 73 SP. Das entspricht Sprint 0 plus 4 Sprints à 2 Wochen bei angenommen ~18 SP pro Sprint. Die Velocity wird nach Sprint 1 neu bewertet; Sprint 1 ist bewusst voll (25 SP), notfalls rutscht US-02 in Sprint 2.

**Release 1.1, „versteht das Schuljahr“:** US-60, 24, 23, 09, 40, 41, 44, 45, 13, 17, 21, 16, 55, **19 (Widgets)** → erste öffentliche Store-Version

**Release 1.2+:** Auswertungen (US-12, 43), Live Activity, Kontrollzentrum, Siri, Lerngruppen, Tagebuch, Stundenplan, Monetarisierung

## 8. Sprint-Plan (Vorschlag)

| Sprint | Sprintziel | Inhalt |
|---|---|---|
| **0** | „Wir können loslegen“ | TE-01, TE-07, Wireframes, Start von SP-01 und SP-03, Developer-Account |
| **1** | „Ich kann Zeit erfassen“ | TE-02, TE-03, TE-08, US-01, 10, 02 |
| **2** | „Erfassen geht schnell und fehlerarm“ | US-03, 04, 34, 35, 15 |
| **3** | „Ich sehe meine Woche im Kontext“ | US-59, 27, 08, 07 |
| **4** | „Bereit für TestFlight“ | US-28, 49, 53, 54, 56, Bugfixing, TE-05 |

## 9. Akzeptanzkriterien (Auswahl)

**US-01 Timer**
- Wenn ich eine Kategorie antippe, startet ein Timer und wird prominent angezeigt.
- „Stopp“ speichert einen Eintrag mit Start, Ende, Dauer und Kategorie.
- Es läuft immer höchstens ein Timer. Startet man einen zweiten, wird der erste mit einem Hinweis beendet.

**US-02 Manueller Eintrag**
- Pflichtfelder: Datum, Start, und entweder Ende oder Dauer. Das Ende muss nach dem Start liegen.
- Überlappende Einträge lösen eine Warnung aus, werden aber nicht blockiert.

**US-10 Timer-Persistenz**
- Gespeichert wird der Startzeitpunkt, kein laufender Zähler. Nach einem Neustart stimmt die Dauer auf die Sekunde.

**US-35 Vergessener Timer**
- Läuft ein Timer länger als ein einstellbarer Schwellwert (Standard 4 h) oder über Mitternacht, fragt die App beim nächsten Öffnen nach dem tatsächlichen Ende.

**US-59 Bundesland und Schulform**
- Auswahl aus allen 16 Bundesländern und einer bundeslandspezifischen Liste von Schulformen (aus SP-01).
- Die Auswahl ist jederzeit in den Einstellungen änderbar. Bestehende Einträge bleiben dabei unverändert.

**US-08 Soll-Arbeitszeit**
- Eingabe von Wochenarbeitszeit (h), Teilzeitanteil (%) und Pflichtstunden.
- Die Wochenübersicht zeigt Ist, Soll und Differenz. Ohne eingegebenes Soll wird nur das Ist gezeigt.

**US-49 Alle Daten löschen**
- Doppelte Bestätigung. Danach ist die App im Zustand einer Erstinstallation.

## 10. Definition of Done

- Akzeptanzkriterien erfüllt und vom Product Owner abgenommen
- Unit-Tests für Logik (Zeitberechnung, Soll/Ist, Datumsgrenzen); UI-Test für den Kernfluss
- Keine Compiler-Warnungen, SwiftLint sauber
- VoiceOver und Dynamic Type für neue Screens geprüft, Dark Mode geprüft
- Alle Texte in String Catalogs
- Keine neuen Netzwerkzugriffe oder Dritt-SDKs ohne PO-Entscheidung (Datenschutzversprechen)
- Läuft im Simulator und auf mindestens einem echten iPhone; per TestFlight verteilbar

## 11. Definition of Ready

- Story ist im Format „Als … möchte ich … damit …“ formuliert und hat Akzeptanzkriterien
- Abhängigkeiten (z. B. ein Spike) sind erledigt
- Story ist geschätzt und passt in einen Sprint

## 12. Risiken und offene Punkte

| # | Thema | Status |
|---|---|---|
| 1 | Länderdaten sind aufwendig zu recherchieren und ändern sich. Mitigation: Spike SP-01, Werte immer überschreibbar, Quelle und Stand anzeigen | offen |
| 2 | Monetarisierung (kostenlos, Einmalkauf, Freemium) | später entscheiden (US-57) |
| 3 | Wer betreibt die App rechtlich (Privatperson oder Organisation)? Das betrifft Impressum und Developer-Account | offen |
| 4 | Alternative Marktplätze nur in der EU; Aufwand unklar | Spike SP-04 |
| 5 | In der Cloud-Umgebung gibt es kein macOS/Xcode. Builds und UI-Tests laufen lokal oder in macOS-CI | bekannt |
| 6 | Android- oder Web-Version | vorerst nicht geplant |

## 13. Nächste Schritte

1. PO prüft die Ergänzungen (🆕/✏️) und die MVP-Auswahl
2. Punkt 3 der Risiken klären (Betreiber der App)
3. Sprint 0 planen: Projektsetup, Wireframes der vier Kernscreens (Heute/Timer, Eintrag, Woche, Einstellungen), Spikes starten
