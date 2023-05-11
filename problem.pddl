(define (problem problem_name) (:domain lpc_domain)
(:objects 
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (sponda-sx lupo pecora cavolo)
    (barca-pos s)
    (barca-vuota)
)

(:goal (and
    (sponda-dx pecora )
    (sponda-sx lupo)
    )
))
