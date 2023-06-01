;Header and description

(define (domain jealous_husbands_ncouples)

(:requirements :typing :fluents :disjunctive-preconditions :equality)


(:types
    husband
    wife
)


(:predicates ;todo: define predicates here

    (on-dx-h ?h - husband)
    (on-sx-h ?h - husband)

    (on-dx-w ?w - wife)
    (on-sx-w ?w - wife)

    (couple ?h - husband ?w - wife)

    (on-dx-boat)
    (on-sx-boat)
)

(:functions
    (husbands-on-dx)
    (husbands-on-sx)
    (wives-on-dx)
    (wives-on-sx)
)


;To move a couple I have to find myself in a situation where there are both on one bank and on the other
;couples already formed, because otherwise I find myself in a situation that is not correct
(:action move-couple-to-dx
    :parameters (?h - husband ?w - wife)
    :precondition (and
                    ;husband,wife and boat on the same bank
                    (on-sx-h ?h)
                    (on-sx-w ?w)
                    (on-sx-boat)

                    ;specify relation between wife and husband
                    (couple ?h ?w)

                    ;condition that says that the number of husbands and wives on the banks are equal
                    (=(husbands-on-dx)(wives-on-dx))
                    (=(husbands-on-sx)(wives-on-sx))
                )

    :effect (and 
                (on-dx-h ?h)
                (on-dx-w ?w)
                (on-dx-boat )               
                (increase (husbands-on-dx) 1)
                (increase (wives-on-dx) 1)
                
                (not (on-sx-h ?h))
                (not (on-sx-w ?w))
                (not(on-sx-boat ))
                (decrease (husbands-on-sx) 1)
                (decrease (wives-on-sx) 1)
            )
)


(:action move-couple-to-sx
    :parameters (?h - husband ?w - wife)
    :precondition (and
                    ;husband,wife and boat on the same bank
                    (on-dx-h ?h)
                    (on-dx-w ?w)
                    (on-dx-boat )

                    ;specify relation between wife and husband
                    (couple ?h ?w)

                    ;condition that says that the number of husbands and wives on the banks are equal
                    (=(husbands-on-dx)(wives-on-dx))
                    (=(husbands-on-sx)(wives-on-sx))
                )

    :effect (and 
                (on-sx-h ?h)
                (on-sx-w ?w)
                (on-sx-boat )
                (increase (husbands-on-sx) 1)
                (increase (wives-on-sx) 1)


                (not (on-dx-h ?h))
                (not (on-dx-w ?w))
                (not(on-dx-boat ))
                (decrease (husbands-on-dx) 1)
                (decrease (wives-on-dx) 1)
            )
)



;-------------------------------------------------------------------------------------
;Moving the husbands is done by moving n-1 husbands where n is the number of seats on the boat
(:action move-husbands-to-dx
    :parameters (?h1 ?h2 ?h3 ?h4 -husband ?w1 ?w2 ?w3 ?w4 -wife)
    :precondition (or
                    ;situation where the husbands separate from their wives
                    (and
                        ;husbands and wifes must be on the same bank, together with the boat
                        (on-sx-h ?h1)
                        (on-sx-h ?h2)
                        (on-sx-h ?h3)
                        (on-sx-h ?h4)

                        (on-sx-w ?w1)
                        (on-sx-w ?w2)
                        (on-sx-w ?w3)
                        (on-sx-w ?w4)

                        (on-sx-boat)

                        ;specify relation between wife and husband
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)
                        (couple ?h3 ?w3)
                        (couple ?h4 ?w4)

                        
                        ;when there are only those couples on the bank then the husbands can leave
                        (=(husbands-on-sx) 4)
                        (=(wives-on-sx) 4)

                    )

                    ;situation when the husbands come back to their wives
                    (and
                        ;hubsands with their wives on the other bank
                        (on-sx-h ?h1)
                        (on-sx-h ?h2)
                        (on-sx-h ?h3)
                        (on-sx-h ?h4)
                       
                        (on-sx-boat)

                        ;specify relation between wife and husband
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)
                        (couple ?h3 ?w3)
                        (couple ?h4 ?w4)

                        (=(wives-on-dx) 4)
                        (=(husbands-on-dx) 0)

                    )
                    

                )

    :effect (and 
                (on-dx-h ?h1)
                (on-dx-h ?h2)
                (on-dx-h ?h3)
                (on-dx-h ?h4)
                (on-dx-boat)
                (increase (husbands-on-dx) 4)

                (not (on-sx-h ?h1))
                (not (on-sx-h ?h2))
                (not (on-sx-h ?h3))
                (not (on-sx-h ?h4))
                (not(on-sx-boat ))
                (decrease (husbands-on-sx) 4)
            )
)


(:action move-husbands-to-sx
    :parameters (?h1 ?h2 ?h3 ?h4 -husband ?w1 ?w2 ?w3 ?w4 -wife)
    :precondition (or
                    ;situation where the husbands separate from their wives
                    (and
                        ;husbands and wifes must be on the same bank, together with the boat
                        (on-dx-h ?h1)
                        (on-dx-h ?h2)
                        (on-dx-h ?h3)
                        (on-dx-h ?h4)

                        (on-dx-w ?w1)
                        (on-dx-w ?w2)
                        (on-dx-w ?w3)
                        (on-dx-w ?w4)

                        (on-dx-boat)

                        ;specify relation between wife and husband
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)
                        (couple ?h3 ?w3)
                        (couple ?h4 ?w4)

                        
                        ;when there are only those couples on the bank then the husbands can leave
                        (=(husbands-on-dx) 4)
                        (=(wives-on-dx) 4)

                    )

                    ;situation when the husbands come back to their wives
                    (and
                        ;hubsands with their wives on the other bank
                        (on-dx-h ?h1)
                        (on-dx-h ?h2)
                        (on-dx-h ?h3)
                        (on-dx-h ?h4)

                        (on-sx-w ?w1)
                        (on-sx-w ?w2)
                        (on-sx-w ?w3)
                        (on-sx-w ?w4)
                       
                        (on-dx-boat)

                        ;specify relation between wife and husband
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)
                        (couple ?h3 ?w3)
                        (couple ?h4 ?w4)

                        (=(wives-on-sx) 4)
                        (=(husbands-on-sx) 0)

                    )
                    

                )

    :effect (and 
                (on-sx-h ?h1)
                (on-sx-h ?h2)
                (on-sx-h ?h3)
                (on-sx-h ?h4)
                (on-sx-boat)
                (increase (husbands-on-dx) 4)

                (not (on-dx-h ?h1))
                (not (on-dx-h ?h2))
                (not (on-dx-h ?h3))
                (not (on-dx-h ?h4))
                (not(on-dx-boat ))
                (decrease (husbands-on-sx) 4)
            )
)


;-------------------------------------------------------------------------------------
;When moving wives we can move n of them to the other bank where n is the number of seats on the boat
(:action move-wives-to-dx
    :parameters (?w1 ?w2 ?w3 ?w4 ?w5 -wife)
    :precondition (or
                    ;situation when the wifes separate from their husbands
                    (and
                        ;wives have to be on the same bank, together with the boat 
                        (on-sx-w ?w1)
                        (on-sx-w ?w2)
                        (on-sx-w ?w3)
                        (on-sx-w ?w4)
                        (on-sx-w ?w5)

                        (on-sx-boat)

                        ;wives can leave only if there are no husbands on the other bank
                        (= (husbands-on-dx) 0)
                        ;(not (= ?w1 ?w2 ?w3 ?w4 ?w5)) ;verify to not move the same wife twice
                        
                    )

                    ;situation when the wifes come back to their husbands
                    (and

                        ;wifes has to be on the same bank, together with the boat   
                        (on-sx-w ?w1)
                        (on-sx-w ?w2)
                        (on-sx-w ?w3)
                        (on-sx-w ?w4)
                        (on-sx-w ?w5)

                        (on-sx-boat )

                        ;they can leave only if there are no husbands on the same bank
                        (= (husbands-on-sx) 0)
                        ;(not (= ?w1 ?w2 ?w3 ?w4 ?w5)) ;verify to not move the same wife twice
                    )

                )

    :effect (and 
                (on-dx-w ?w1)
                (on-dx-w ?w2)
                (on-dx-w ?w3)
                (on-dx-w ?w4)
                (on-dx-w ?w5)
                (on-dx-boat)
                (increase (wives-on-dx) 5)

                (not (on-sx-w ?w1))
                (not (on-sx-w ?w2))
                (not (on-sx-w ?w3))
                (not (on-sx-w ?w4))
                (not (on-sx-w ?w5))
                (not(on-sx-boat ))
                (decrease (wives-on-sx) 5)
            )
)


(:action move-wives-to-sx
    :parameters (?w1 ?w2 ?w3 ?w4 ?w5 -wife)
    :precondition (or
                    ;situation when the wifes separate from their husbands
                    (and
                        ;wives have to be on the same bank, together with the boat 
                        (on-dx-w ?w1)
                        (on-dx-w ?w2)
                        (on-dx-w ?w3)
                        (on-dx-w ?w4)
                        (on-dx-w ?w5)

                        (on-dx-boat)

                        ;wives can leave only if there are no husbands on the other bank
                        (= (husbands-on-sx) 0)
                        ;(not (= ?w1 ?w2 ?w3 ?w4 ?w5)) ;verify to not move the same wife twice
                        
                    )

                    ;situation when the wifes come back to their husbands
                    (and

                        ;wifes has to be on the same bank, together with the boat   
                        (on-dx-w ?w1)
                        (on-dx-w ?w2)
                        (on-dx-w ?w3)
                        (on-dx-w ?w4)
                        (on-dx-w ?w5)

                        (on-dx-boat )

                        ;they can leave only if there are no husbands on the same bank
                        (= (husbands-on-dx) 0)
                        ;(not (= ?w1 ?w2 ?w3 ?w4 ?w5)) ;verify to not move the same wife twice
                    )

                )

    :effect (and 
                (on-sx-w ?w1)
                (on-sx-w ?w2)
                (on-sx-w ?w3)
                (on-sx-w ?w4)
                (on-sx-w ?w5)
                (on-sx-boat)
                (increase (wives-on-sx) 5)

                (not (on-dx-w ?w1))
                (not (on-dx-w ?w2))
                (not (on-dx-w ?w3))
                (not (on-dx-w ?w4))
                (not (on-dx-w ?w5))
                (not(on-dx-boat ))
                (decrease (wives-on-dx) 5)
            )
)

;-------------------------------------------------------------------------------------------------------------
;I can move a maximum of (n-1)/2 couples since we have odd number of seats on the boat
(:action move-couples-to-dx
    :parameters (?h1 ?h2 - husband ?w1 ?w2 - wife)
    :precondition (and
                    ;couples must be on the same boat and boat on the same bank
                    (on-sx-h ?h1)
                    (on-sx-h ?h2)
                    (on-sx-w ?w1)
                    (on-sx-w ?w2)
                    (on-sx-boat)

                    ;specify relation between wife and husband
                    (couple ?h1 ?w1)
                    (couple ?h2 ?w2)

                    ;condition that says that the number of husbands and wives on the banks are equal
                    (=(husbands-on-dx)(wives-on-dx))
                    (=(husbands-on-sx)(wives-on-sx))
                )

    :effect (and 
                (on-dx-h ?h1)
                (on-dx-h ?h2)
                (on-dx-w ?w1)
                (on-dx-w ?w2)
                (on-dx-boat )               
                (increase (husbands-on-dx) 2)
                (increase (wives-on-dx) 2)
                
                (not (on-sx-h ?h1))
                (not (on-sx-h ?h2))
                (not (on-sx-w ?w1))
                (not (on-sx-w ?w2))
                (not(on-sx-boat ))
                (decrease (husbands-on-sx) 2)
                (decrease (wives-on-sx) 2)
            )
)


(:action move-couples-to-sx
    :parameters (?h1 ?h2 - husband ?w1 ?w2 - wife)
    :precondition (and
                    ;couples must be on the same boat and boat on the same bank
                    (on-dx-h ?h1)
                    (on-dx-h ?h2)
                    (on-dx-w ?w1)
                    (on-dx-w ?w2)
                    (on-dx-boat)

                    ;specify relation between wife and husband
                    (couple ?h1 ?w1)
                    (couple ?h2 ?w2)

                    ;condition that says that the number of husbands and wives on the banks are equal
                    (=(husbands-on-dx)(wives-on-dx))
                    (=(husbands-on-sx)(wives-on-sx))
                )

    :effect (and 
                (on-sx-h ?h1)
                (on-sx-h ?h2)
                (on-sx-w ?w1)
                (on-sx-w ?w2)
                (on-sx-boat )               
                (increase (husbands-on-dx) 2)
                (increase (wives-on-sx) 2)
                
                (not (on-dx-h ?h1))
                (not (on-dx-h ?h2))
                (not (on-dx-w ?w1))
                (not (on-dx-w ?w2))
                (not(on-dx-boat ))
                (decrease (husbands-on-dx) 2)
                (decrease (wives-on-dx) 2)
            )

)


;-------------------------------------------------------------------------------------
(:action move-wife-to-dx
    :parameters (?w1 -wife)
    :precondition (or
                    (and
                        
                        (on-sx-w ?w1)
                        (on-sx-boat )

                        
                        ;if there are no husbands on her bank she can go back to her husband on the other bank
                        (=(husbands-on-sx) 0)
                        
                    )

                    (and
                        (on-sx-w ?w1)
                        (on-sx-boat )

                        
                        ;if there is no husband on the opposite bank she can easily go
                        (=(husbands-on-dx) 0)
                    )

                )

    :effect (and 
                (on-dx-w ?w1)
                (on-dx-boat)
                (increase (wives-on-dx) 1)

                (not (on-sx-w ?w1))
                (not(on-sx-boat))
                (decrease (wives-on-sx) 1)
            )
)


(:action move-wife-to-sx
    :parameters (?w1 -wife)
    :precondition (or
                    (and
                        
                        (on-dx-w ?w1)
                        (on-dx-boat)

                        
                        ;if there are no husbands on her bank she can go back to her husband on the other bank
                        (=(husbands-on-dx) 0)
                        
                    )

                    (and
                        (on-dx-w ?w1)
                        (on-dx-boat )

                        
                        ;if there is no husband on the opposite bank she can easily go
                        (=(husbands-on-sx) 0)
                    )

                )

    :effect (and 
                (on-sx-w ?w1)
                (on-sx-boat)
                (increase (wives-on-sx) 1)

                (not (on-dx-w ?w1))
                (not(on-dx-boat))
                (decrease (wives-on-dx) 1)
            )
)

)
