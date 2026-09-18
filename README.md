# Escaping the Mud

![Dal Big Ball of Mud a un core di dominio al centro](images/hero-escaping-the-mud.png)

Slide per organizzare il codice in modo pulito, con le **regole di business al centro**.

Framework, database e UI restano dettagli implementativi: il dominio guida il design, non lo stack.

## Percorsi

Una storia sola, in ordine. Il numero resta quello della cartella, anche quando l'ordine di lettura cambia.

| # | Percorso | Cosa affronta |
|---|---|---|
| 1 | [DDD vs Framework](1.DDD-vs-framework/README.md) | Confronto tra approccio framework/database-centric e Domain-Driven Design |
| 2 | [DDD strategico — Trovare i confini](2.DDD-strategico/README.md) | Dove finisce un modello e ne comincia un altro |
| 3 | [DDD tattico — Le regole prendono forma](3.DDD-tattico/README.md) | Come una regola di business diventa codice |
| 4 | [Architettura esagonale](4.Hexagonal-architecture/README.md) | Ports & Adapters: proteggere il core con contratti e traduzioni |
| 7 | [Persistenza — il modello e lo schema](7.Persistenza/README.md) | Aggregate e tabelle, repository come port, transazioni, conflitti *(in corso)* |

## Letture laterali

Si innestano dove vuoi: non servono per andare avanti. Non sono numerate, e le slide sull'AI restano sempre per ultime.

| Percorso | Cosa affronta |
|---|---|
| [Complessità e moduli profondi](5.PhilosophyofSoftwareDesign/README.md) | Appunti (capp. 1–8): fango, bordi stretti, regola al centro |
| [Agentic AI](99.Agentic-Ai/README.md) | Da chat ad agenti: loop, harness, memoria, MCP, skills |

I percorsi che chiudono le promesse ancora aperte — persistenza, eventi, test, moduli — stanno nella [roadmap](ROADMAP.md).
