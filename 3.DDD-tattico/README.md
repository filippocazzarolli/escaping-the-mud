# DDD tattico — Le regole prendono forma

Come una regola di business diventa codice — *dentro* un contesto.

Il [percorso 2](../2.DDD-strategico/README.md) ha chiuso i confini. Qui si entra in **Vendite**: ordine, righe, conferma, annullamento. Catalogo e magazzino restano fuori perché la mappa lo ha già detto.

![Da setter pubblici a operazioni di dominio](img/06-prima-dopo.png)

## Percorso

Leggi i capitoli in ordine. Ogni pagina è collegata alla precedente e alla successiva.

| # | Capitolo | Cosa imparerai |
|---|---|---|
| 1 | [Dalla frase al comportamento](1.dalla-frase-al-comportamento.md) | Una regola di business è un'operazione, non un campo |
| 2 | [Value object](2.value-object.md) | Denaro e quantità: vincoli nel tipo, uguaglianza per valore |
| 3 | [Entità](3.entita.md) | Identità stabile e passaggi di stato espliciti |
| 4 | [Aggregate](4.aggregate.md) | Quali invarianti proteggere insieme, e perché |
| 5 | [Use case e dominio](5.use-case-e-dominio.md) | Coordinare fuori, custodire le regole dentro |
| 6 | [Prima / dopo](6.prima-dopo.md) | Da setter pubblici a operazioni di dominio |

## L'idea in una frase

Una regola ha un'**operazione** e un rifiuto, non un flag. I tipi chiudono i buchi; l'aggregate tiene insieme ciò che deve cambiare nello stesso momento.

---

**Inizia da qui →** [1. Dalla frase al comportamento](1.dalla-frase-al-comportamento.md)
