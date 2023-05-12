;Header and description

(define (domain domain_lpc)

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

(:action transportingRight
  :parameters (?x - daTrasportare ?y - trasportatore)
  :precondition (and (on-sx ?x) (on-sx-barca ?y))
  :effect (and (on-dx ?x)(not (on-sx ?x))(on-dx-barca ?y)(not (on-sx-barca ?y)))
)


(:action transportingLeft
  :parameters (?x - daTrasportare ?y - trasportatore)
  :precondition (and (on-dx ?x) (on-dx-barca ?y) )
                        
  :effect (and (on-sx ?x)(not (on-dx ?x))(on-sx-barca ?y)(not (on-dx-barca ?y)))
)

(:action emptyLeft
  :parameters (?y - trasportatore)
  :precondition (and (on-dx-barca ?y) )
                        
  :effect (and (on-sx-barca ?y)(not (on-dx-barca ?y)))
)

(:action emptyRight
  :parameters (?y - trasportatore)
  :precondition (and (on-sx-barca ?y) )
                        
  :effect (and (on-dx-barca ?y)(not (on-sx-barca ?y)))
)



;define actions here

)