
(define (domain lpc_domain)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality :disjunctive-preconditions)


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
    :precondition (or (sponda-sx lupo vuoto cavolo barca)(sponda-sx lupo vuoto vuoto barca))
    :effect (and (sponda-dx lupo ?c  ?p barca) (not (sponda-sx lupo ?c ?p barca)))
)
;azione muovi lupo da destra a sinistra
(:action move-lupo-dx-sx
    :parameters (?c ?p)
    :precondition (or (sponda-dx lupo vuoto cavolo barca)(sponda-dx lupo vuoto vuoto barca))
    :effect (and (sponda-sx lupo ?c  ?p barca) (not (sponda-dx lupo ?c ?p barca)))
)
;azione muovi cavolo da sinistra a destra
(:action move-cavolo-sx-dx
    :parameters (?c ?p)
    :precondition (or (sponda-sx cavolo vuoto lupo barca)(sponda-sx cavolo vuoto vuoto barca))
    :effect (and (sponda-dx cavolo ?c  ?p barca) (not (sponda-sx cavolo ?c ?p barca)))
)
;azione muovi cavolo da destra a sinistra
(:action move-cavolo-dx-sx
    :parameters (?c ?p)
    :precondition (or (sponda-dx cavolo vuoto lupo barca)(sponda-dx cavolo vuoto vuoto barca))
    :effect (and (sponda-sx cavolo ?c  ?p barca) (not (sponda-dx cavolo ?c ?p barca)))
)


)