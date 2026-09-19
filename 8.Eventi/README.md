# Eventi — quello che succede dopo il confine

Un fatto di Vendite, e chi ascolta sta oltre.

Il [percorso 3](../3.DDD-tattico/README.md) ha detto che confermare un ordine è un fatto, e ha lasciato fuori mail ed evento. Il [percorso 7](../7.Persistenza/README.md) ha messo la transazione intorno a carica, decide, salva — e ha tenuto la pubblicazione fuori dal riquadro. Arriva qui. La [context map](../2.DDD-strategico/4.context-map.md) aveva già disegnato chi ascolta: magazzino, pagamento.

![Un fatto di Vendite: il mittente non sa chi ascolta](img/01-fatto-vs-chiamata.png)

## Percorso

Leggi i capitoli in ordine. Ogni pagina è collegata alla precedente e alla successiva.

| # | Capitolo | Cosa imparerai |
|---|---|---|
| 1 | [Un fatto, non una chiamata](1.un-fatto-non-una-chiamata.md) | `OrdineConfermato` al passato: il mittente non sa chi ascolta |
| 2 | [Evento di dominio ed evento di integrazione](2.dominio-e-integrazione.md) | Uno vive dentro il confine, l'altro è un contratto pubblico |
| 3 | [Salvare e pubblicare](3.salvare-e-pubblicare.md) | Due sistemi, nessuna transazione in comune: l'outbox |
| 4 | [Coerenza differita](4.coerenza-differita.md) | Il magazzino riserva un attimo dopo: cosa dice il business |
| 5 | [Lo stesso messaggio due volte](5.stesso-messaggio-due-volte.md) | Consegna almeno una volta, idempotenza |
| 6 | [Coreografia od orchestrazione](6.coreografia-od-orchestrazione.md) | Il pagamento come processo lungo, e quando serve un direttore |

## L'idea in una frase

Un **fatto** attraversa il confine. Il mittente non chiama chi ascolta: pubblica, e la traduzione sta al bordo.

---

**Inizia da qui →** [1. Un fatto, non una chiamata](1.un-fatto-non-una-chiamata.md)
