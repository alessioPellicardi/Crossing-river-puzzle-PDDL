# Mastermind-PDDL
This is the PDDL representation of the game Mastermind, including a GUI that shows the plan



# REGOLE DEL GIOCO:

**Giocatori**

Si gioca in due, un codificatore ed un decifratore.

**Strumenti**

Una tabella con dei fori in cui posizionare i piolini colorati. I piolini sono di 2 tipi: pioli codice, suddivisi in sei colori e pioli chiave, più piccoli dei pioli codici e di colore bianco e nero, che servono a dare indicazione a chi dovrà indovinare il codice segreto.

**Regole**

All'inizio il codificatore posiziona 4 pioli colorati nei fori appositi, usando una qualsiasi combinazione dei 6 colori e senza farsi vedere dal decifratore. Quest'ultimo, di volta in volta, compone una combinazione, che sarà lasciata sulla tabella, posizionando i suoi pioli colorati. Il codificatore da le informazioni utilizzando i pioli chiave in questo modo:
piolo bianco: indica che un colore è esatto ma nella posizione sbagliata
piolo nero: indica che un colore è esatto e nella posizione corretta
I pioli chiavi vengono collocati in una qualsiasi posizione. I ruoli si invertono quando sono finiti tutti e 9 i tentativi o se il codice viene indovinato.

**Punteggio**

Si conta un punto per il codificatore se, finiti i tentativi del decifratore, la combinazione non è stata indovinata; in caso contrario il punto va al decifratore.

**Scopo**

Lo scopo, da parte del codificatore, è di creare una combinazione di colori che non consenta al decifratore di risolverla prima di aver finito il proprio numero di tentativi. Di contro, lo scopo del decifratore è quello di indovinare la combinazione entro il numero di tentavi cha ha a disposizione.
