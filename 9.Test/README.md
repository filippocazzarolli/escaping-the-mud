# Test — il conto del design

I test difficili sono un sintomo, non uno strumento.

Il [percorso 4](../4.Hexagonal-architecture/5.perche-usarla.md) ha già dato la regola: un port, due adapter; se il secondo non si scrive, il contratto non è pulito. Il [percorso 3](../3.DDD-tattico/README.md) ha messo le regole in operazioni. Il [percorso 7](../7.Persistenza/2.repository-e-un-port.md) ha dato un nome a `Ordini`. Qui si incassa: se il design tiene, i test sono corti.

![Il dominio si testa senza mock e senza container](img/01-dominio-senza-mock.png)

## Percorso

Leggi i capitoli in ordine. Ogni pagina è collegata alla precedente e alla successiva.

| # | Capitolo | Cosa imparerai |
|---|---|---|
| 1 | [Il dominio si testa senza niente](1.dominio-senza-niente.md) | `ordine.conferma()` è una funzione con regole |
| 2 | [Un port, due adapter, un test](2.un-port-due-adapter.md) | La stessa suite verifica il fake e la produzione |
| 3 | [Lo use case con adapter in memoria](3.use-case-in-memoria.md) | La sequenza, non il database |
| 4 | [Il test parla la lingua del business](4.lingua-del-business.md) | «Un ordine confermato non si modifica» come nome |
| 5 | [Quando il test chiede di cambiare design](5.quando-il-test-chiede-design.md) | Setup lunghi e cinque mock: cosa segnalano |
| 6 | [Cosa non testare](6.cosa-non-testare.md) | Mock del proprio codice, copertura come obiettivo |

## L'idea in una frase

Un test **corto** è il conto di un bordo stretto. Se per dire «un confermato non si modifica» servono trenta righe, il design sta mentendo.

---

**Inizia da qui →** [1. Il dominio si testa senza niente](1.dominio-senza-niente.md)
