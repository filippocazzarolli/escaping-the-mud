# Roadmap — argomenti da aggiungere

Documento di lavoro. Non è una slide: è la lista dei task, tagliata **un task = un capitolo**.

L'ordine non è arbitrario. I primi quattro percorsi chiudono **debiti che le slide dichiarano già**: frasi come «la persistenza arriverà» o «quando arriverà» esistono nel testo e non hanno una destinazione. Il lettore li sta aspettando.

## Come è tagliato un task

Ogni capitolo è scrivibile e verificabile da solo. Un task è **fatto** quando:

- il file è `N.slug.md` nella cartella del percorso, 40–55 righe
- ha `# N. Titolo` e sotto una tagline in corsivo
- ha la barra di navigazione in testa (`← prec · Indice · succ →`) e in coda (con **Avanti:**)
- ha **una** immagine in `img/NN-slug.png`, con alt testuale descrittivo
- l'esempio è quello corrente: Vendite, `Ordine`, `RigaOrdine`, «un ordine confermato non si modifica»
- gli snippet sono in blocchi ` ```text ` (pseudo-codice, non un framework)
- contiene una sezione di confine — «Cosa resta fuori» o «Cosa non è questo capitolo»
- l'ultimo paragrafo apre il capitolo successivo
- `scripts/check-links.sh` passa

Lo scheletro da copiare sta in `_template/capitolo.md`; quello del README di percorso in `_template/percorso-README.md`.

Peso: **S** capitolo corto, **M** standard, **L** concetti nuovi o molti file esistenti da toccare.

## Fase 0 — Fondamenta — fatta

| Task | Cosa | Esito |
|---|---|---|
| T0.1 | Template di capitolo e di README di percorso | `_template/capitolo.md`, `_template/percorso-README.md` |
| T0.2 | Numerazione | Percorsi numerati in ordine di lettura; letture laterali senza numero, con le slide sull'AI sempre per ultime (`99.Agentic-Ai`) |
| T0.3 | Catena dei percorsi | I percorsi 1 e 4 ora agganciano il seguente; 5 e 6 rimandano alla mappa. Ogni ultimo capitolo chiude con «Mappa dei percorsi» |
| T0.4 | Controllo dei link | `scripts/check-links.sh`: link relativi, immagini mancanti e immagini non usate |

**Decisione su T0.2.** I nuovi percorsi sono `7.Persistenza`, `8.Eventi`, `9.Test`, `10.Moduli`: si accodano alle cartelle esistenti, senza rinominare niente. In lettura vengono dopo il percorso 4 e prima delle letture laterali, perché nessuna delle due serve per andare avanti.

Le **slide sull'AI stanno sempre per ultime**. Per non doverle rinumerare ogni volta che nasce un percorso, la cartella è `99.Agentic-Ai`: il numero non è una posizione in classifica, è un modo di dire «in fondo, qualunque cosa arrivi prima». Nel README radice le letture laterali non hanno numero: non sono passi di una sequenza.

Resta aperto il caso degli appunti su Ousterhout: sono anche loro una lettura laterale, ma la cartella è ancora `5`, quindi nell'albero compaiono prima dei percorsi 7–10. Se dà fastidio, si toglie il numero anche a loro — oggi le cita solo il README radice e un capitolo del percorso 4.

## Fase 1 — Percorso 7: Persistenza — resta P7.7

Fatti **P7.0** → **P7.6** e **P7.8**. Resta solo **P7.7**, le sei immagini: ogni capitolo porta al loro posto un commento `P7.7` con la descrizione del diagramma da fare.

Il debito è chiuso in cinque punti: `3.DDD-tattico/2.value-object.md`, `4.aggregate.md`, `5.use-case-e-dominio.md`, `4.Hexagonal-architecture/5.perche-usarla.md` e `6.sintesi.md`, che ora aggancia il percorso 7 come passo seguente invece degli appunti sulla complessità.

Il capitolo 6 chiude il percorso e rimanda al percorso sugli eventi senza link: è una delle promesse che P8.8 deve trasformare in collegamento.

Debito chiuso. La frase era:

> «Non è la transazione del database, non è un lock, non è "un aggregate = una tabella". **La persistenza arriverà**.»
> — `3.DDD-tattico/4.aggregate.md:37`

| Task | Capitolo | Contenuto chiave | Immagine | Peso |
|---|---|---|---|---|
| P7.0 | README di percorso | Tabella capitoli, «L'idea in una frase», aggancio ai percorsi 3 e 4 | riuso | S |
| P7.1 | Un aggregate non è una tabella | `Ordine` + `RigaOrdine` su due tabelle, `Denaro` su due colonne, stato come stringa: la forma dello stato non è la forma della regola | `01-aggregate-vs-tabelle.png` | M |
| P7.2 | Il repository è un port | `Ordini.diId(...)` e `Ordini.salva(...)` come contratto del core. Niente `Repository<T>` generico, niente `findAll`, niente query builder che risale nel dominio | `02-repository-port.png` | M |
| P7.3 | Il mapping sta nell'adapter | Nessuna annotazione ORM nel core. E la domanda che il percorso 3 crea: **se non ci sono setter pubblici, come si ricostruisce l'aggregate dal database?** | `03-traduzione-adapter.png` | L |
| P7.4 | Chi apre la transazione | Il confine transazionale è dello use case, non del dominio. Un aggregate per transazione, e perché `salva` non è un flush | `04-transazione-use-case.png` | M |
| P7.5 | Due utenti, stesso ordine | Lock ottimistico e versione. Il conflitto è un esito che il dominio sa nominare, non uno stacktrace SQL | `05-lock-ottimistico.png` | M |
| P7.6 | Quando basta l'entità del framework | Il doppio modello si paga dove c'è complessità. Sui sottodomini generici e di supporto, una riga e via | `06-dove-vale-il-doppio-modello.png` | S |
| P7.7 | Le sei immagini | Diagrammi coerenti con lo stile dei percorsi 2–4 | — | M |
| P7.8 | Chiusura del debito | Trasformare le promesse in link: `3.DDD-tattico/4.aggregate.md:37`, `3.DDD-tattico/5.use-case-e-dominio.md:37` (le porte carica/salva), `3.DDD-tattico/2.value-object.md:44` («non è JPA embeddable»), `4.Hexagonal-architecture/6.sintesi.md:39`, più la riga nel README radice | M |

Fuori: tutorial di un ORM specifico, event sourcing, CQRS.

## Fase 2 — Percorso 8: Eventi

Debiti da chiudere:

> «Chi ascolta — magazzino che riserva scorta — sta oltre il confine.»
> — `3.DDD-tattico/4.aggregate.md:33`

> `// poi: avvisa, evento, email — fuori dal modello`
> — `3.DDD-tattico/5.use-case-e-dominio.md:22`

| Task | Capitolo | Contenuto chiave | Immagine | Peso |
|---|---|---|---|---|
| P8.0 | README di percorso | Aggancio alla context map del percorso 2 e all'aggregate del percorso 3 | riuso | S |
| P8.1 | Un fatto, non una chiamata | `OrdineConfermato` al passato. Il mittente non sa chi ascolta: differenza da `magazzino.riserva(...)` chiamato dentro `conferma()` | `01-fatto-vs-chiamata.png` | M |
| P8.2 | Evento di dominio ed evento di integrazione | Uno vive dentro il confine ed è ricco; l'altro è un contratto pubblico, povero e versionato. Il payload non esporta il modello | `02-dominio-vs-integrazione.png` | L |
| P8.3 | Salvare e pubblicare | Due sistemi, nessuna transazione in comune. L'outbox come soluzione noiosa e giusta | `03-outbox.png` | M |
| P8.4 | Coerenza differita | Il magazzino riserva un attimo dopo. Cosa dice il business quando la scorta non c'è: la coerenza immediata è una scelta di business, non tecnica | `04-coerenza-differita.png` | M |
| P8.5 | Lo stesso messaggio due volte | Consegna almeno una volta, idempotenza, chi si difende | `05-idempotenza.png` | M |
| P8.6 | Coreografia od orchestrazione | Il pagamento come processo lungo, e quando serve un process manager. Una riga per dire che l'event sourcing è un altro discorso | `06-coreografia-vs-orchestrazione.png` | M |
| P8.7 | Le sei immagini | — | — | M |
| P8.8 | Chiusura del debito | Link da `3.DDD-tattico/4.aggregate.md:33`, dal commento in `3.DDD-tattico/5.use-case-e-dominio.md:22`, dal satellite Pagamento in `2.DDD-strategico/4.context-map.md:17`, dai rimandi in `7.Persistenza/4.chi-apre-la-transazione.md` e `7.Persistenza/6.quando-basta-il-framework.md`, più il README radice | M |

## Fase 3 — Percorso 9: Test

Debito da chiudere: il percorso esagonale dedica una sezione alla testabilità e formula una regola operativa, ma in tutto il repo non c'è un test.

> «Se non riesci a scrivere il secondo, il port probabilmente **non è un contratto abbastanza pulito**.»
> — `4.Hexagonal-architecture/5.perche-usarla.md:61`

| Task | Capitolo | Contenuto chiave | Immagine | Peso |
|---|---|---|---|---|
| P9.0 | README di percorso | La tesi: i test difficili sono un sintomo di design, non di strumenti | riuso | S |
| P9.1 | Il dominio si testa senza niente | `ordine.conferma()` è una funzione con regole: nessun mock, nessun container | `01-dominio-senza-mock.png` | M |
| P9.2 | Un port, due adapter, un test | La regola del percorso 4 in codice: la stessa suite verifica il fake e la tecnologia di produzione | `02-suite-condivisa.png` | M |
| P9.3 | Lo use case con adapter in memoria | `OrdiniInMemoria`: verificare la sequenza senza verificare il database | `03-use-case-in-memoria.png` | M |
| P9.4 | Il test parla la lingua del business | «Un ordine confermato non si modifica» come nome del test. Il test come documentazione del dominio | `04-nome-del-test.png` | S |
| P9.5 | Quando il test chiede di cambiare design | Setup di trenta righe, cinque mock, test fragile: cosa sta segnalando il bordo | `05-sintomi.png` | M |
| P9.6 | Cosa non testare | Mock del proprio codice, asserzioni sui getter, copertura come obiettivo, test sugli adapter di altri | `06-cosa-non-testare.png` | S |
| P9.7 | Le sei immagini | — | — | M |
| P9.8 | Chiusura del debito | Link dalla sezione «Testabilità by design» e dalla regola «un port, due adapter» (`4.Hexagonal-architecture/5.perche-usarla.md:38-61`) e dalla riga Test della mappa mentale (`6.sintesi.md:26`) | S |

## Fase 4 — Percorso 10: Monolite modulare

Debito da chiudere:

> «Il monolite modulare — **quando arriverà** — parla di moduli e dipendenze.»
> — `2.DDD-strategico/2.sottodominio-e-bounded-context.md:33`

| Task | Capitolo | Contenuto chiave | Immagine | Peso |
|---|---|---|---|---|
| P10.0 | README di percorso | Dal confine del modello al modulo. Il deploy resta un'altra decisione | riuso | S |
| P10.1 | Dal contesto al modulo | Un bounded context diventa un modulo, non un servizio. Cosa cambia e cosa no | `01-contesto-modulo.png` | M |
| P10.2 | Cosa vede un modulo | API pubblica del modulo contro il suo interno: visibilità, cartelle, descrittori | `02-api-del-modulo.png` | M |
| P10.3 | Chi chiama chi | La context map diventa grafo delle dipendenze fra moduli: direzione, dipendenze permesse, cicli | `03-grafo-moduli.png` | M |
| P10.4 | Il confine che si fa rispettare | Test di architettura: un confine che non è un accordo verbale | `04-test-di-architettura.png` | M |
| P10.5 | Un database o tanti schemi | Schema per modulo, nessuna join fra moduli, chi possiede il dato | `05-schemi-per-modulo.png` | L |
| P10.6 | Quando estrarre un servizio | Segnali veri — scala, ritmo di rilascio, team — e perché il modulo è il prerequisito | `06-quando-estrarre.png` | M |
| P10.7 | Le sei immagini | — | — | M |
| P10.8 | Chiusura del debito | Link da `2.DDD-strategico/2.sottodominio-e-bounded-context.md:33` e dai segnali di `6.quando-il-confine-si-muove.md`, più il README radice | S |

## Ordine e dipendenze

- La fase 0 precede tutto. T0.2 in particolare, perché decide i nomi delle cartelle.
- Fase 1 e fase 3 sono indipendenti fra loro: si possono affrontare in qualunque ordine.
- Fase 2 conviene dopo la fase 1: l'outbox presuppone il capitolo su transazione e salvataggio.
- Fase 4 è autonoma, ma il capitolo P10.5 cita la persistenza della fase 1.
- Dentro un percorso: prima P?.0, poi i capitoli in ordine, poi le immagini, e per ultimo P?.8. La chiusura del debito va sempre in fondo, perché è l'unico task che modifica slide esistenti.

## Backlog — dopo i debiti

Non sono buchi dichiarati: sono estensioni. Restano fuori dalle quattro fasi.

| Argomento | Nota |
|---|---|
| Uscire dal fango che esiste già | Cuciture, anticorruption layer, strangler fig. È il titolo del repo e lo scenario mai trattato |
| Ousterhout, secondo blocco (capp. 9–21) | Errori definiti fuori dall'esistenza, progettarlo due volte, nomi, commenti come design, codice ovvio |
| Percorso 3, capitoli aggiuntivi | Creazione valida, servizio di dominio (oggi solo accennato), errori di dominio |
| Percorso 4, capitoli aggiuntivi | Composition root e struttura delle cartelle; quando **non** mettere un port |
| Percorso 2, capitoli aggiuntivi | Il metodo di scoperta (EventStorming, Example Mapping); appendice sui pattern di relazione fra contesti |
| Agentic AI, estensione | Un tool è un port; valutazione degli agenti; permessi; e il ponte finale: perché un core con bordi stretti è leggibile anche da un agente |
| Altri | CQRS e read model, validazione al bordo, autorizzazione, osservabilità come driven port, decisioni scritte, galleria di anti-pattern |

Fuori portata per scelta: microservizi e infrastruttura, tutorial legati a un framework, tassonomia DDD completa, event sourcing come percorso a sé.
