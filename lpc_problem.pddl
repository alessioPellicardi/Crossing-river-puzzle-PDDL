(define (problem lpc_problem) (:domain lpc_domain)
    (:requirements :negative-preconditions)
(:objects 
    lupo 
    pecora 
    cavolo 
    barca 
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (sponda-sx cavolo pecora lupo barca)
)

(:goal (and
    ;todo: put the goal condition here
    (sponda-dx cavolo pecora lupo barca)
      (not (sponda-sx cavolo pecora lupo barca))
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
