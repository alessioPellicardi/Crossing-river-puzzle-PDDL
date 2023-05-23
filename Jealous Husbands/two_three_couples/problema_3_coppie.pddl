(define (problem jealous_husbands_p) (:domain jealous_husbands_d)

(:requirements :fluents)
(:objects 
    h1 h2 h3 - husband
    w1 w2 w3 - wife
)

(:init
    (on-sx-h h1)
    (on-sx-h h2)
    (on-sx-h h3)
    (=(husbands-on-sx) 3)
    (=(husbands-on-dx) 0)

    (on-sx-w w1)
    (on-sx-w w2)
    (on-sx-w w3)
    (=(wives-on-sx) 3)
    (=(wives-on-dx) 0)

    (on-sx-boat)
  
    (couple h1 w1)
    (couple h2 w2)
    (couple h3 w3)

)

(:goal (and
    (on-dx-h h1)
    (on-dx-h h2)
    (on-dx-h h3)
    (=(husbands-on-sx) 0)
    (=(husbands-on-dx) 3)

    (on-dx-w w1)
    (on-dx-w w2)
    (on-dx-w w3)
    (=(wives-on-sx) 0)
    (=(wives-on-dx) 3)

    (on-dx-boat)

)

)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
