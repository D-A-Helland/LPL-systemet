# Feilsøkingsprosesser

## IPC connection closed

Feilen vi fikk med meldingen "IPC connection closed" førte til den største feilsøkingsprosessen på hele prosjektet.

"IPC connection closed" betyr i praksis at kommunikasjonslinjen mellom hovedprosessen (Vite/Nuxt) og en bakgrunnsprosess (en "worker") har blitt brutt fordi bakgrunnsprosessen krasjet.

Vi fant to måter å fikse dette på: 
- Den ene var å starte en ny branch fra en versjon som fungerte med git. 
- Den andre måten var å finne ut hva som lagde feilen og fikse det, 

### Ting som kunne forårsake IPC connection closed

Node pakker som manglet eller hadde feil versjon
- Dette kunne vi fikse ved å slette node_modules mappen og kjøre "npm install"

### Prisma motoren krasjer

Hvis vi hadde dratt ned en ny versjon fra git var det noen ganger at prisma motoren krasjet
- Dette kunne fikses ved å kjøre "npx prisma generate"

### Annet

Noen ganger klarte vi aldri å finne feilen, og da var vi nødt til å gå tilbake til en fungerende versjon med git og fortsette med den istedenfor.

