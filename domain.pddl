
(define (domain lpc_domain)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

(:predicates 
(sponda-sx ?x)
(sponda-dx ?x ?y ?z )
(a-bordo ?x)
(barca-vuota)
(barca-pos ?x)
)


;azione muovi pecora da destra a sinistra
(:action move_goat_ds
    :parameters (?x ?y ?z)
    :precondition (and (sponda-dx pecora)(not(sponda-sx  ?x lupo cavolo))(barca-pos d)(barca-vuota))
    :effect (and (sponda-sx pecora ?x ?y)(not(sponda-dx pecora))(not(barca-pos d))(barca-pos s))
)
;azione muovi pecora da sinistra a destra
(:action move_goat_sd
    :parameters (?x ?y ?z)
    :precondition (and (sponda-sx pecora)(not(sponda-dx  ?x lupo cavolo))(barca-pos s)(barca-vuota))
    :effect (and (sponda-dx pecora ?x ?y)(not(sponda-sx pecora))(not(barca-pos s))(barca-pos d))
)

)