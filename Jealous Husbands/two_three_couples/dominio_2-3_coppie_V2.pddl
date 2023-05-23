;Header and description

(define (domain jealous_husbands_d)

(:requirements :typing :fluents :disjunctive-preconditions :equality)


(:types
    husband
    wife
)


(:predicates ;todo: define predicates here

    (on-dx-h ?h - husband)
    (on-sx-h ?h - husband)

    (on-dx-w ?w - wife)
    (on-sx-w ?w - wife)

    (couple ?h - husband ?w - wife)

    (on-dx-boat)
    (on-sx-boat)
)

(:functions
    (husbands-on-dx)
    (husbands-on-sx)
    (wives-on-dx)
    (wives-on-sx)
)


;Per muovere una coppia mi devo trovare nella situazione in cui sia su una sponda che sull'altra ci siano
;coppie già formate, perchè se no mi trovo in una situazione che non è corretta
(:action move-couple-to-dx
    :parameters (?h - husband ?w - wife)
    :precondition (and
                    ;marito,moglie e barca sulla stessa sponda
                    (on-sx-h ?h)
                    (on-sx-w ?w)
                    (on-sx-boat)

                    ;istanzio relazione tra marito e moglie
                    (couple ?h ?w)

                    ;condizione che il numero di mariti e mogli sulle sponde siano uguali
                    (=(husbands-on-dx)(wives-on-dx))
                    (=(husbands-on-sx)(wives-on-sx))
                )

    :effect (and 
                (on-dx-h ?h)
                (on-dx-w ?w)
                (on-dx-boat )               
                (increase (husbands-on-dx) 1)
                (increase (wives-on-dx) 1)
                
                (not (on-sx-h ?h))
                (not (on-sx-w ?w))
                (not(on-sx-boat ))
                (decrease (husbands-on-sx) 1)
                (decrease (wives-on-sx) 1)
            )
)


(:action move-couple-to-sx
    :parameters (?h - husband ?w - wife)
    :precondition (and
                    ;marito,moglie e barca sulla stessa sponda
                    (on-dx-h ?h)
                    (on-dx-w ?w)
                    (on-dx-boat )

                    ;istanzio relazione tra marito e moglie
                    (couple ?h ?w)

                    ;condizione che il numero di mariti e mogli sulle sponde siano uguali
                    (=(husbands-on-dx)(wives-on-dx))
                    (=(husbands-on-sx)(wives-on-sx))
                )

    :effect (and 
                (on-sx-h ?h)
                (on-sx-w ?w)
                (on-sx-boat )
                (increase (husbands-on-sx) 1)
                (increase (wives-on-sx) 1)


                (not (on-dx-h ?h))
                (not (on-dx-w ?w))
                (not(on-dx-boat ))
                (decrease (husbands-on-dx) 1)
                (decrease (wives-on-dx) 1)
            )
)



;-------------------------------------------------------------------------------------
(:action move-husbands-to-dx
    :parameters (?h1 ?h2 -husband ?w1 ?w2 -wife)
    :precondition (or
                    ;situazione in cui si separano dalle loro mogli
                    (and
                        ;i mariti e le loro mogli devono essere sulla stessa sponda, insiema alla barca
                        (on-sx-h ?h1)
                        (on-sx-h ?h2)
                        (on-sx-w ?w1)
                        (on-sx-w ?w2)

                        (on-sx-boat)

                        ;istanzio relazione tra mariti e mogli
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)

                        ;quando ci sono solamente quelle coppie lì sulla riva allora possono andarsene i mariti
                        (=(husbands-on-sx) 2)
                        (=(wives-on-sx) 2)

                    )

                    ;situazione in cui tornano dalle mogli
                    (and
                        ;i mariti con almeno una delle mogli sull'altra sponda
                        (on-sx-h ?h1)
                        (on-sx-h ?h2)
                        (or
                            (and
                                (on-dx-w ?w1)
                                (on-dx-w ?w2)  
                            )

                            (and
                                (on-sx-w ?w1)
                                (on-dx-w ?w2)  
                            )

                            (and
                                (on-dx-w ?w1)
                                (on-sx-w ?w2)  
                            )

                        )
                        
                        (on-sx-boat)

                        ;istanzio relazione tra mariti e mogli
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)

                        ;sull'altra sponda ci sono solo le mogli dei mariti o anche solo una delle due, senza altri mariti
                        (<=(wives-on-dx) 2)
                        (=(husbands-on-dx) 0)

                    )
                    

                )

    :effect (and 
                (on-dx-h ?h1)
                (on-dx-h ?h2)
                (on-dx-boat)
                (increase (husbands-on-dx) 2)

                (not (on-sx-h ?h1))
                (not (on-sx-h ?h2))
                (not(on-sx-boat ))
                (decrease (husbands-on-sx) 2)
            )
)


(:action move-husbands-to-sx
    :parameters (?h1 ?h2 -husband ?w1 ?w2 -wife)
    :precondition (or
                    ;situazione in cui si separano dalle loro mogli
                    (and
                        ;i mariti e le loro mogli devono essere sulla stessa sponda, insiema alla barca
                        (on-dx-h ?h1)
                        (on-dx-h ?h2)
                        (on-dx-w ?w1)
                        (on-dx-w ?w2)

                        (on-dx-boat)

                        ;istanzio relazione tra mariti e mogli
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)

                        ;quando ci sono solamente quelle coppie lì sulla riva
                        (=(husbands-on-dx) 2)
                        (=(wives-on-dx) 2)
                        (not(= ?h1 ?h2)) ;controllo di non spostare lo stesso marito per errore

                    )

                    ;situazione in cui tornano dalle mogli
                    (and
                        ;i mariti con almeno una delle mogli sull'altra sponda
                        (on-dx-h ?h1)
                        (on-dx-h ?h2)
                        (or
                            (and
                                (on-sx-w ?w1)
                                (on-sx-w ?w2)  
                            )

                            (and
                                (on-sx-w ?w1)
                                (on-dx-w ?w2)  
                            )

                            (and
                                (on-dx-w ?w1)
                                (on-sx-w ?w2)  
                            )

                        )

                        (on-dx-boat)

                        ;istanzio relazione tra mariti e mogli
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)

                        ;sull'altra sponda ci sono solo le mogli dei mariti, senza altri mariti
                        (<=(wives-on-sx) 2)
                        (=(husbands-on-sx) 0)
                        (not(= ?h1 ?h2)) ;controllo di non spostare lo stesso marito per errore
                        

                    )
                    

                )

    :effect (and 
                (on-sx-h ?h1)
                (on-sx-h ?h2)
                (on-sx-boat)
                (increase (husbands-on-sx) 2)

                
                (not (on-dx-h ?h1))
                (not (on-dx-h ?h2))
                (not(on-dx-boat))
                (decrease (husbands-on-dx) 2)
            )
)


;-------------------------------------------------------------------------------------
(:action move-wives-to-dx
    :parameters (?w1 ?w2 -wife)
    :precondition (or
                    ;caso in cui lasciano i loro mariti
                    (and
                        ;le mogli devono essere sulla stessa sponda con la barca  
                        (on-sx-w ?w1)
                        (on-sx-w ?w2)

                        (on-sx-boat)

                        ;possono andarsene se non ci sono mariti sull'altra sponda
                        (= (husbands-on-dx) 0)
                        (not (= ?w1 ?w2)) ;controllo di non prendere due mogli uguali
                        
                    )

                    ;caso in cui vanno dai mariti
                    (and

                        ;le mogli devono essere sulla stessa sponda con la barca   
                        (on-sx-w ?w1)
                        (on-sx-w ?w2)

                        (on-sx-boat )

                        ;possono andarsene se non ci sono mariti sulla sponda in cui sono
                        (= (husbands-on-sx) 0)
                        (not (= ?w1 ?w2)) ;controllo di non prendere due mogli uguali
                    )

                )

    :effect (and 
                (on-dx-w ?w1)
                (on-dx-w ?w2)
                (on-dx-boat)
                (increase (wives-on-dx) 2)

                (not (on-sx-w ?w1))
                (not (on-sx-w ?w2))
                (not(on-sx-boat ))
                (decrease (wives-on-sx) 2)
            )
)


(:action move-wives-to-sx
    :parameters (?w1 ?w2 -wife)
    :precondition (or
                    ;caso in cui lasciano i loro mariti
                    (and
                        ;le mogli devono essere sulla stessa sponda con la barca   
                        (on-dx-w ?w1)
                        (on-dx-w ?w2)

                        (on-dx-boat )

                        ;possono andarsene se non ci sono mariti sull'altra sponda
                        (= (husbands-on-sx) 0)
                        (not (= ?w1 ?w2)) ;controllo di non prendere due mogli uguali
                        
                    )

                    ;caso in cui vanno dai mariti
                    (and
                        ;le mogli devono essere sulla stessa sponda con la barca   
                        (on-dx-w ?w1)
                        (on-dx-w ?w2)

                        (on-dx-boat )

                        ;possono andarsene se non ci sono mariti sulla sponda in cui sono
                        (= (husbands-on-dx) 0)
                        (not (= ?w1 ?w2))

                    )

                )

    :effect (and 
                (on-sx-w ?w1)
                (on-sx-w ?w2)
                (on-sx-boat )
                (increase (wives-on-sx) 2)

                (not (on-dx-w ?w1))
                (not (on-dx-w ?w2))
                (not(on-dx-boat))
                (decrease (wives-on-dx) 2)
            )
)

;-------------------------------------------------------------------------------------
(:action move-husband-to-dx
    :parameters (?h1 -husband ?w1 -wife)
    :precondition (or
                    (and
                        ;il marito e la moglie sono sulla stessa sponda insieme alla barca   
                        (on-sx-h ?h1)
                        (on-sx-w ?w1)
                        (on-sx-boat)

                        (couple ?h1 ?w1)

                        ;nel momento che è l'unica coppia sulla sponda posso lasciare la moglie da sola
                        (=(husbands-on-sx) 1)
                        (=(wives-on-sx) 1)
                    )


                    (and
                        ;il marito e la barca sono sulla sponda opposta rispetto alla moglie  
                        (on-sx-h ?h1)
                        (on-dx-w ?w1)
                        (on-sx-boat)

                        (couple ?h1 ?w1)

                        ;se la moglie è dall'altra parte senza nessun altro marito allora è situazione valida
                        (=(husbands-on-dx) 0)
                    )

                )

    :effect (and 
                (on-dx-h ?h1)
                (on-dx-boat)
                (increase (husbands-on-dx) 1)

                (not (on-sx-h ?h1))
                (not(on-sx-boat ))
                (decrease (husbands-on-sx) 1)
            )
)

(:action move-husband-to-sx
    :parameters (?h1 -husband ?w1 -wife)
    :precondition (or
                    (and
                        ;il marito e la moglie sono sulla stessa sponda insieme alla barca 
                        (on-dx-h ?h1)
                        (on-dx-w ?w1)
                        (on-dx-boat)

                        (couple ?h1 ?w1)

                        ;nel momento che è l'unica coppia sulla sponda posso lasciare la moglie da sola
                        (=(husbands-on-dx) 1)
                        (=(wives-on-dx) 1)
                    )


                    (and
                        ;il marito e la barca sono sulla sponda opposta rispetto alla moglie  
                        (on-dx-h ?h1)
                        (on-sx-w ?w1)
                        (on-dx-boat)

                        (couple ?h1 ?w1)

                        ;se la moglie è dall'altra parte senza nessun altro marito allora è situazione valida
                        (=(husbands-on-sx) 0)
                    )

                )

    :effect (and 
                (on-sx-h ?h1)
                (on-sx-boat)
                (increase (husbands-on-sx) 1)

                (not (on-dx-h ?h1))
                (not(on-dx-boat ))
                (decrease (husbands-on-dx) 1)
            )
)


;-------------------------------------------------------------------------------------
(:action move-wife-to-dx
    :parameters (?w1 -wife)
    :precondition (or
                    (and
                        
                        (on-sx-w ?w1)
                        (on-sx-boat )

                        ;se non c'è nessun marito sulla sua spiaggia può tornare dal suo sull'altra sponda
                        (=(husbands-on-sx) 0)
                        
                    )

                    (and
                        (on-sx-w ?w1)
                        (on-sx-boat )

                        ;se non c'è nessun marito sulla spiaggia opposta può andare tranquillamente
                        (=(husbands-on-dx) 0)
                    )

                )

    :effect (and 
                (on-dx-w ?w1)
                (on-dx-boat)
                (increase (wives-on-dx) 1)

                (not (on-sx-w ?w1))
                (not(on-sx-boat))
                (decrease (wives-on-sx) 1)
            )
)


(:action move-wife-to-sx
    :parameters (?w1 -wife)
    :precondition (or
                    (and
                        
                        (on-dx-w ?w1)
                        (on-dx-boat)

                        ;se non c'è nessun marito sulla sua spiaggia può tornare dal suo sull'altra sponda
                        (=(husbands-on-dx) 0)
                        
                    )

                    (and
                        (on-dx-w ?w1)
                        (on-dx-boat )

                        ;se non c'è nessun marito sulla spiaggia opposta può andare tranquillamente
                        (=(husbands-on-sx) 0)
                    )

                )

    :effect (and 
                (on-sx-w ?w1)
                (on-sx-boat)
                (increase (wives-on-sx) 1)

                (not (on-dx-w ?w1))
                (not(on-dx-boat))
                (decrease (wives-on-dx) 1)
            )
)

)
