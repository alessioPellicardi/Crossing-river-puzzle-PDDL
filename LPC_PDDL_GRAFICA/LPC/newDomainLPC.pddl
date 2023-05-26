;Header and description

(define (domain newDomainLPC)

;remove requirements that are not needed

; un-comment following line if constants are needed
;(:constants )

(:types
  daTrasportare
  trasportatore
)

(:predicates ;todo: define predicates here
    (on-dx ?x - daTrasportare)
    (on-sx ?x - daTrasportare)

    (on-dx-barca ?y - trasportatore)
    (on-sx-barca ?y - trasportatore)

)

(:action trasporta-cavolo-destra
  :parameters (?y - trasportatore)
  :precondition (or 
                    (and
                        (on-sx cavolo)
                        (on-sx-barca ?y) 
                        (on-sx lupo) 
                        (on-dx pecora)
                    )

                    (and
                        (on-sx cavolo)
                        (on-sx-barca ?y) 
                        (on-dx lupo) 
                        (on-sx pecora)
                    )

                )

  :effect (and (on-dx cavolo)(not (on-sx cavolo)) (on-dx-barca ?y)(not (on-sx-barca ?y)))
)

(:action trasporta-cavolo-sinistra
  :parameters (?y - trasportatore)
  :precondition (or 
                    (and
                        (on-dx cavolo)
                        (on-dx-barca ?y) 
                        (on-sx lupo) 
                        (on-dx pecora)
                    )

                    (and
                        (on-dx cavolo)
                        (on-dx-barca ?y) 
                        (on-dx lupo) 
                        (on-sx pecora)
                    )

                )
  :effect (and (on-sx cavolo)(not (on-dx cavolo))(on-sx-barca ?y)(not (on-dx-barca ?y)))
)


(:action trasporta-pecora-destra
  :parameters (?y - trasportatore)
  :precondition (and (on-sx pecora) (on-sx-barca ?y))
  :effect (and (on-dx pecora)(not (on-sx pecora))(on-dx-barca ?y)(not (on-sx-barca ?y)))
)

(:action trasporta-pecora-sinistra
  :parameters (?y - trasportatore)
  :precondition (and (on-dx pecora) (on-dx-barca ?y))
  :effect (and (on-sx pecora)(not (on-dx pecora))(on-sx-barca ?y)(not (on-dx-barca ?y)))
)


(:action trasporta-lupo-destra
  :parameters (?y - trasportatore)
  :precondition  (or 
                    (and
                        (on-sx lupo)
                        (on-sx-barca ?y) 
                        (on-sx pecora) 
                        (on-dx cavolo)
                    )

                    (and
                        (on-sx lupo)
                        (on-sx-barca ?y) 
                        (on-dx pecora) 
                        (on-sx cavolo)
                    )

                )
  :effect (and (on-dx lupo)(not (on-sx lupo))(on-dx-barca ?y)(not (on-sx-barca ?y)))
)

(:action trasporta-lupo-sinistra
  :parameters (?y - trasportatore)
  :precondition (or 
                    (and
                        (on-dx lupo)
                        (on-dx-barca ?y) 
                        (on-dx pecora) 
                        (on-sx cavolo)
                    )

                    (and
                        (on-dx lupo)
                        (on-dx-barca ?y) 
                        (on-sx pecora) 
                        (on-dx cavolo)
                    )

                )
  :effect (and (on-sx lupo)(not (on-dx lupo))(on-sx-barca ?y)(not (on-dx-barca ?y)))
)


; mettere un or in precondition e fare le due situazioni in cui una si ha and tra barca lupo pecora e l'altra barca pecora cavolo

(:action empty-going-right
  :parameters (?y - trasportatore)
  :precondition (or 
                    (and
                        (on-sx-barca ?y)
                        (on-sx lupo)
                        (on-dx pecora)
                    )

                    (and
                        (on-sx-barca ?y)
                        (on-dx lupo)
                        (on-sx pecora)
                    )

                    (and
                        (on-sx-barca ?y)
                        (on-sx cavolo)
                        (on-dx pecora)
                    )

                    (and
                        (on-sx-barca ?y)
                        (on-dx cavolo)
                        (on-sx pecora)
                    )
                    
                )           
  :effect (and (on-dx-barca ?y)(not (on-sx-barca ?y)))
)

(:action empty-going-left
  :parameters (?y - trasportatore)
  :precondition (or 
                    (and
                        (on-dx-barca ?y)
                        (on-sx lupo)
                        (on-dx pecora)
                    )

                    (and
                        (on-dx-barca ?y)
                        (on-dx lupo)
                        (on-sx pecora)
                    )

                    (and
                        (on-dx-barca ?y)
                        (on-sx cavolo)
                        (on-dx pecora)
                    )

                    (and
                        (on-dx-barca ?y)
                        (on-dx cavolo)
                        (on-sx pecora)
                    )
                    
                )
                        
  :effect (and (on-sx-barca ?y)(not (on-dx-barca ?y)))
)



;define actions here

)