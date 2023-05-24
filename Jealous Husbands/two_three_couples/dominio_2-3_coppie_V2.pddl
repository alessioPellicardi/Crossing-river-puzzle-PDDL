;Header and description

(define (domain jealous_husbands_d)

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
(:action move-husbands-to-dx
    :parameters (?h1 ?h2 -husband ?w1 ?w2 -wife)
    :precondition (or
                    ;situation where the husbands separate from their wives
                    (and
                        ;husbands and wifes must be on the same bank, together with the boat
                        (on-sx-h ?h1)
                        (on-sx-h ?h2)
                        (on-sx-w ?w1)
                        (on-sx-w ?w2)

                        (on-sx-boat)

                        ;specify relation between wife and husband
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)

                        
                        ;when there are only those couples on the bank then the husbands can leave
                        (=(husbands-on-sx) 2)
                        (=(wives-on-sx) 2)

                    )

                    ;situation when the husbands come back to their wives
                    (and
                        ;hubsands with at least one wife on the other bank
                        (on-sx-h ?h1)
                        (on-sx-h ?h2)
                        (or
                            (and
                                (on-dx-w ?w1)
                                (on-dx-w ?w2)  
                            )

                            (and
                                (on-sx-w ?w1)
                                (on-dx-w ?w2)  
                            )

                            (and
                                (on-dx-w ?w1)
                                (on-sx-w ?w2)  
                            )

                        )
                        
                        (on-sx-boat)

                        ;specify relation between wife and husband
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)

                        ;on the other bank there are only the wives of the husbands or even just one of the two, without other husbands
                        (<=(wives-on-dx) 2)
                        (=(husbands-on-dx) 0)

                    )
                    

                )

    :effect (and 
                (on-dx-h ?h1)
                (on-dx-h ?h2)
                (on-dx-boat)
                (increase (husbands-on-dx) 2)

                (not (on-sx-h ?h1))
                (not (on-sx-h ?h2))
                (not(on-sx-boat ))
                (decrease (husbands-on-sx) 2)
            )
)


(:action move-husbands-to-sx
    :parameters (?h1 ?h2 -husband ?w1 ?w2 -wife)
    :precondition (or
                    ;situation when the husbands separate from their wives
                    (and
                        
                        ;husbands and wifes must be on the same bank, together with the boat
                        (on-dx-h ?h1)
                        (on-dx-h ?h2)
                        (on-dx-w ?w1)
                        (on-dx-w ?w2)

                        (on-dx-boat)

                        ;specify relation between wife and husband
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)

                        ;only when there are those couples on the bank
                        (=(husbands-on-dx) 2)
                        (=(wives-on-dx) 2)
                        (not(= ?h1 ?h2)) ;verify to not move the same husband twice

                    )

                    ;situation when they come back to their wives
                    (and
                        ;husbands with at least one wife on the other bank
                        (on-dx-h ?h1)
                        (on-dx-h ?h2)
                        (or
                            (and
                                (on-sx-w ?w1)
                                (on-sx-w ?w2)  
                            )

                            (and
                                (on-sx-w ?w1)
                                (on-dx-w ?w2)  
                            )

                            (and
                                (on-dx-w ?w1)
                                (on-sx-w ?w2)  
                            )

                        )

                        (on-dx-boat)

                        ;specify relation between wife and husband
                        (couple ?h1 ?w1)
                        (couple ?h2 ?w2)

                        
                        ;on the other bank there are only the wives of the husbands, without other husbands
                        (<=(wives-on-sx) 2)
                        (=(husbands-on-sx) 0)
                        (not(= ?h1 ?h2)) ;verify to not move the same husband twice
                        

                    )
                    

                )

    :effect (and 
                (on-sx-h ?h1)
                (on-sx-h ?h2)
                (on-sx-boat)
                (increase (husbands-on-sx) 2)

                
                (not (on-dx-h ?h1))
                (not (on-dx-h ?h2))
                (not(on-dx-boat))
                (decrease (husbands-on-dx) 2)
            )
)


;-------------------------------------------------------------------------------------
(:action move-wives-to-dx
    :parameters (?w1 ?w2 -wife)
    :precondition (or
                    ;situation when the wifes separate from their husbands
                    (and
                        ;wifes has to be on the same bank, together with the boat 
                        (on-sx-w ?w1)
                        (on-sx-w ?w2)

                        (on-sx-boat)

                        ;wifes can leave only if there are no husbands on the other bank
                        (= (husbands-on-dx) 0)
                        (not (= ?w1 ?w2)) ;verify to not move the same wife twice
                        
                    )

                    ;situation when the wifes come back to their husbands
                    (and

                        ;wifes has to be on the same bank, together with the boat   
                        (on-sx-w ?w1)
                        (on-sx-w ?w2)

                        (on-sx-boat )

                        ;they can leave only if there are no husbands on the same bank
                        (= (husbands-on-sx) 0)
                        (not (= ?w1 ?w2)) ;verify to not move the same wife twice
                    )

                )

    :effect (and 
                (on-dx-w ?w1)
                (on-dx-w ?w2)
                (on-dx-boat)
                (increase (wives-on-dx) 2)

                (not (on-sx-w ?w1))
                (not (on-sx-w ?w2))
                (not(on-sx-boat ))
                (decrease (wives-on-sx) 2)
            )
)


(:action move-wives-to-sx
    :parameters (?w1 ?w2 -wife)
    :precondition (or
                    ;situaton when the wifes separate from their husbands
                    (and
                        ;wifes has to be on the same bank, together with the boat   
                        (on-dx-w ?w1)
                        (on-dx-w ?w2)

                        (on-dx-boat )

                        ;they can leave only if there are no husbands on the other bank
                        (= (husbands-on-sx) 0)
                        (not (= ?w1 ?w2)) ;verify to not move the same wife twice
                        
                    )

                    ;situation when they go back to their husbands
                    (and
                        ;wifes has to be on the same bank, together with the boat   
                        (on-dx-w ?w1)
                        (on-dx-w ?w2)

                        (on-dx-boat )

                        ;they can leave only if there are no husbands on the same bank
                        (= (husbands-on-dx) 0)
                        (not (= ?w1 ?w2))

                    )

                )

    :effect (and 
                (on-sx-w ?w1)
                (on-sx-w ?w2)
                (on-sx-boat )
                (increase (wives-on-sx) 2)

                (not (on-dx-w ?w1))
                (not (on-dx-w ?w2))
                (not(on-dx-boat))
                (decrease (wives-on-dx) 2)
            )
)

;-------------------------------------------------------------------------------------
(:action move-husband-to-dx
    :parameters (?h1 -husband ?w1 -wife)
    :precondition (or
                    (and
                        ;husband and wife are on the same bank, together with the boat
                        (on-sx-h ?h1)
                        (on-sx-w ?w1)
                        (on-sx-boat)

                        (couple ?h1 ?w1)

                       
                        ;since is the only couple on the bank, the husband can leave the wife alone
                        (=(husbands-on-sx) 1)
                        (=(wives-on-sx) 1)
                    )


                    (and
                        ;husband and boat are on the opposite bank of the wife 
                        (on-sx-h ?h1)
                        (on-dx-w ?w1)
                        (on-sx-boat)

                        (couple ?h1 ?w1)

                        
                        ;if the wife is on the other bank without any other husband, then the situation is valid
                        (=(husbands-on-dx) 0)
                    )

                )

    :effect (and 
                (on-dx-h ?h1)
                (on-dx-boat)
                (increase (husbands-on-dx) 1)

                (not (on-sx-h ?h1))
                (not(on-sx-boat ))
                (decrease (husbands-on-sx) 1)
            )
)

(:action move-husband-to-sx
    :parameters (?h1 -husband ?w1 -wife)
    :precondition (or
                    (and
                        ;husband and wife are on the same bank, together with the boat 
                        (on-dx-h ?h1)
                        (on-dx-w ?w1)
                        (on-dx-boat)

                        (couple ?h1 ?w1)

                        ;since is the only couple on the bank, the husband can leave the wife alone
                        (=(husbands-on-dx) 1)
                        (=(wives-on-dx) 1)
                    )


                    (and
                        ;husband and boat are on the opposite bank of the wife
                        (on-dx-h ?h1)
                        (on-sx-w ?w1)
                        (on-dx-boat)

                        (couple ?h1 ?w1)

                       
                        ;if the wife is on the other bank without any other husband, then the situation is valid
                        (=(husbands-on-sx) 0)
                    )

                )

    :effect (and 
                (on-sx-h ?h1)
                (on-sx-boat)
                (increase (husbands-on-sx) 1)

                (not (on-dx-h ?h1))
                (not(on-dx-boat ))
                (decrease (husbands-on-dx) 1)
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
