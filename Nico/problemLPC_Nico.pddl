(define (problem problemLPC) (:domain newDomainLPC)
(:objects 
    lupo pecora cavolo - daTrasportare
    barca - trasportatore
)

(:init
   (on-sx lupo)
   (on-sx pecora)
   (on-sx cavolo)
   (on-sx-barca barca)
)

(:goal (and
    (on-dx lupo)
    (on-dx pecora)
    (on-dx cavolo)
    (on-dx-barca barca)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
