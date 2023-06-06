(define (problem jealous_husbands_p) (:domain jealous_husbands_ncouples_simpler)

(:requirements :fluents)
(:objects 
    h1 h2 h3 h4 h5 h6 - husband
    w1 w2 w3 w4 w5 w6 - wife
) 

(:init
    (on-sx-h h1)
    (on-sx-h h2)
    (on-sx-h h3)
    (on-sx-h h4)
    (on-sx-h h5)
    (on-sx-h h6)
    (=(husbands-on-sx) 6)
    (=(husbands-on-dx) 0)

    (on-sx-w w1)
    (on-sx-w w2)
    (on-sx-w w3)
    (on-sx-w w4)
    (on-sx-w w5)
    (on-sx-w w6)
    (=(wives-on-sx) 6)
    (=(wives-on-dx) 0)

    (on-sx-boat)
  
    (couple h1 w1)
    (couple h2 w2)
    (couple h3 w3)
    (couple h4 w4)
    (couple h5 w5)
    (couple h6 w6)

)

(:goal (and
    (on-dx-h h1)
    (on-dx-h h2)
    (on-dx-h h3)
    (on-dx-h h4)
    (on-dx-h h5)
    (on-dx-h h6)
    (=(husbands-on-sx) 0)
    (=(husbands-on-dx) 6)

    (on-dx-w w1)
    (on-dx-w w2)
    (on-dx-w w3)
    (on-dx-w w4)
    (on-dx-w w5)
    (on-dx-w w6)
    (=(wives-on-sx) 0)
    (=(wives-on-dx) 6)

    (on-dx-boat)

)

)


)
