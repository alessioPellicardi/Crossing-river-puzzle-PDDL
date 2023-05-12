
(define (domain lpc_domain)

;remove requirements that are not needed
(:requirements  :disjunctive-preconditions :negative-preconditions)


(:predicates 
(sponda-dx ?c ?p ?l ?b )
(sponda-sx ?c ?p ?l ?b)
(barca-vuota)
)

;azione muovi pecora da sinistra a destra
(:action move-pecora-sx-dx
    :parameters (?c ?l)
    :precondition (and (sponda-sx ?c pecora ?l barca))
    :effect (and (sponda-dx ?c pecora ?l barca)(not (sponda-sx ?c pecora ?l barca )))
)

;azione muovi pecora da destra a sinistra
(:action move-pecora-dx-sx
    :parameters (?c ?l)
    :precondition (and (sponda-dx ?c pecora ?l barca))
    :effect (and (sponda-sx ?c pecora ?l barca)(not (sponda-dx ?c pecora ?l barca )))
)

;azione muovi lupo da sinistra a destra
(:action move-lupo-sx-dx
    :parameters (?c ?p)
    :precondition (or (sponda-sx ?c ?p lupo barca)(not(sponda-sx cavolo pecora lupo barca)))
    :effect (and (sponda-dx ?c  ?p lupo  barca) (not (sponda-sx ?c ?p lupo barca)))
)
;azione muovi lupo da destra a sinistra
(:action move-lupo-dx-sx
    :parameters (?c ?p)
    :precondition (and (sponda-dx ?c ?p lupo barca))
    :effect (and (sponda-sx ?c ?p lupo barca) (not (sponda-dx ?c ?p lupo barca)))
)
;azione muovi cavolo da sinistra a destra
(:action move-cavolo-sx-dx
    :parameters ( ?p ?l)
    :precondition (or (sponda-sx cavolo ?p ?l barca)(not(sponda-sx cavolo pecora lupo barca)))
    :effect (and (sponda-dx cavolo ?p ?l barca) (not (sponda-sx cavolo ?p ?l barca)))
)

;azione muovi cavolo da destra a sinistra
(:action move-cavolo-dx-sx
    :parameters (?p ?l)
    :precondition (and (sponda-dx cavolo ?p ?l barca))
    :effect (and (sponda-sx cavolo ?p  ?l barca) (not (sponda-dx cavolo ?p ?l barca)))
)


)