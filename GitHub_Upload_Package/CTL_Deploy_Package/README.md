# CTL Financial Intelligence

Proiect CTL pentru buletinul financiar zilnic și dashboard public.

## Structură
- `index.html` — dashboard web public, responsive pentru PC și Android.
- `dashboard/index.html` — versiunea dashboardului în folderul de lucru.
- `CTL_Registru_Surse_si_Editorial.xlsx` — registru inițial de surse, structură editorială, Dividend Kings și dicționar de date.
- `database/schema.sql` — schemă inițială PostgreSQL pentru Supabase.
- `collector/run.py` — schelet de colectare; nu introduce date fictive.
- `editorial/CTL_editorial_rules.md` — reguli editoriale și de verificare.
- `.github/workflows/collect.yml` — rulare manuală; programarea periodică rămâne dezactivată până la stabilirea orarului și conectarea surselor.

## Stadiul actual
**PROTOTIP — NU ESTE CONECTAT LA DATE LIVE.** Valorile ilustrative din dashboard sunt marcate DEMO și nu trebuie folosite pentru decizii investiționale. Colectorul nu are încă adaptoare de surse.

## Publicarea dashboardului
1. În repository-ul GitHub: **Add file → Upload files**.
2. Dezarhivează pachetul și încarcă întregul conținut al folderului `CTL_Deploy_Package`, păstrând structura directoarelor.
3. Deschide **Settings → Pages**.
4. La **Build and deployment**, selectează **Deploy from a branch**.
5. Alege branch-ul `main` și folderul `/ (root)`, apoi Save.
6. După publicare, adresa va fi `https://laaur.github.io/financial-intelligence/`.

## Integrare ulterioară
1. Creează un proiect Supabase și rulează `database/schema.sql` în SQL Editor.
2. Configurează secretele `SUPABASE_URL` și `SUPABASE_SERVICE_ROLE_KEY` în **Settings → Secrets and variables → Actions**.
3. Nu introduce cheia service-role în HTML, JavaScript sau în fișiere versionate.
4. Adaugă adaptoare doar după verificarea endpoint-urilor, licențelor și termenilor fiecărei surse.
5. Activează colectarea programată numai după validarea surselor și aprobarea orarului.

## Control editorial
- Se păstrează cele 40 de rubrici originale și anexa Dividend Kings.
- Cele 40 de poziții din registrul inițial sunt placeholder-e până la importul denumirilor exacte din ediția-sursă.
- Fiecare observație trebuie să includă sursă, timestamp, unitate și statut: confirmat / estimat / intraday / demo / neverificat.
- Nu se amestecă valorile de închidere cu cele intraday.

## Costuri și limitări
Proiectul este configurat pentru a porni cu servicii gratuite. Cotele gratuite, disponibilitatea și condițiile furnizorilor se pot modifica. GitHub Pages este public; nu încărca date private.
