;Header and description

(define (domain lpc_domain)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
(sponda-sx ?x)
(sponda-dx ?x ?y ?z )
(a-bordo ?x)
(barca-vuota)
(barca-pos ?x)
)


(:functions ;todo: define numeric functions here
)

;define actions here
(:action move_goat_sd
    :parameters (?x ?y ?z)
    :precondition (and (sponda-sx pecora)(not(sponda-dx  ?x lupo cavolo))(barca-pos s)(barca-vuota))
    :effect (and (sponda-dx pecora ?x ?y)(not(sponda-sx pecora))(not(barca-pos s))(barca-pos d))
)

)