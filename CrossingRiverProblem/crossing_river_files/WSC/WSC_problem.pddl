(define (problem problemWSC) (:domain domainWSC)
(:objects 
    wolf - wolf
    sheep - sheep
    cabbage - cabbage
)

(:init
   (on-sx-w wolf)
   (on-sx-s sheep)
   (on-sx-c cabbage)
   (on-sx-boat)
)

(:goal (and
    (on-dx-w wolf)
    (on-dx-s sheep)
    (on-dx-c cabbage)
    (on-dx-boat)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
