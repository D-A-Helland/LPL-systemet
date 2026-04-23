# Teknisk dokumentasjon – LPL-system

## Innledning

### Formål

Programmet er utviklet for å forenkle og effektivisere administrasjonen av Lundeneset Premiere League. Tidligere ble systemet håndtert gjennom store Excel-ark, men denne løsningen erstatter dette med et mer strukturert og automatisert system.

Systemet gjør det mulig å:

* Administrere spillere, lag, kamper og priser
* Gjennomføre kjøp og salg av spillere
* Gi oversikt til både admin og managere

Admin (ULEFA-president) har full kontroll over systemet og kan gjøre endringer manuelt ved behov.

---

## Teknologistack

### Frontend

* Rammeverk: Nuxt
* UI-komponenter: Nuxt UI
* Styling: Tailwind CSS

### Backend

* Server: Nitro (innebygd i Nuxt)
* API: Filbaserte endpoints
* Runtime: Node.js
* Språk: TypeScript

### Database

* Database: PostgreSQL
* ORM: Prisma

### Verktøy

* Pakkehåndtering: npm
* Versjonskontroll: Git
* Linting: ESLint

---

## Mappestruktur (forenklet)

```
LPL/
├── components/
│   ├── admin/
│   ├── index/
│   └── alleSpillere.vue
├── layouts/
├── pages/
│   ├── manager/
│   ├── admin/
│   └── index.vue
├── server/
├── sql/
├── app.vue
└── README.md
```

---

## Mål for prosjektet

* Erstatte Excel-ark med en strukturert database
* Forenkle og automatisere LPL-systemet
* Lage nettsider for oversikt over spillere og handler
* Gjøre systemet lett å videreutvikle gjennom god dokumentasjon
* Gi admin kontroll over spillere, lag og handler
* La managere forespørre spillerkjøp via systemet

---

## Funksjonalitet

* Admin kan legge til, redigere og slette spillere og lag
* Managere kan forespørre kjøp av spillere
* Admin godkjenner eller avslår handler
* Systemet støtter ubegrenset antall lag og spillere

---

## Utviklingsprosess (kort)

* Opprettelse av prosjekt med Nuxt
* Oppsett av database med Prisma
* Implementering av API og frontend
* Testing og videreutvikling

---

## Viktig databaseinfo

* Bruk av relasjoner mellom tabeller (spillere, lag, kamper osv.)
* Normalisert database for bedre struktur
* Miljøvariabler som:

  * DATABASE_URL
  * API_KEY
  * AUTH_SECRET

---

## Visjon

Systemet skal kunne skaleres til flere klasser og lag i fremtiden. Det er også ønskelig at løsningen kan videreutvikles eller gjenbrukes i andre sammenhenger.

---

## Medvirkende

* Backend utvikler: Daniel Asdahl
* Frontend utvikler: David Aleksander Helland
* Drift sjef: Andreas Tysland Bore
* Lærere: Eirik Ramsli Hauge og Jan Børge Landro
