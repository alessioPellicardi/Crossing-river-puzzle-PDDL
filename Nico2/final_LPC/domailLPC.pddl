;Header and description

(define (domain domainWSC)

(:requirements :typing :fluents :disjunctive-preconditions :equality)


(:types
    wolf
    sheep
    cabbage
)


(:predicates ;todo: define predicates here
    (on-dx-w ?w - wolf)
    (on-sx-w ?w - wolf)
    
    (on-dx-s ?s - sheep)
    (on-sx-s ?s - sheep)

    (on-dx-c ?c - cabbage)
    (on-sx-c ?c - cabbage)

    (on-dx-boat)
    (on-sx-boat)
)


(:action move-sheep-to-dx
    :parameters (?w -wolf ?s -sheep ?c -cabbage)
    :precondition (and 

                    ;the sheep on the sx bank with the boat
                    (on-sx-s ?s)
                    (on-sx-boat)

                    ;it doesn't matter where the others are, I can carry the sheep

                )

    :effect (and 
                (not(on-sx-s ?s))
                (not(on-sx-boat))

                (on-dx-s ?s)
                (on-dx-boat)
            )
)

(:action move-sheep-to-sx
    :parameters (?w -wolf ?s -sheep ?c -cabbage)
    :precondition (and 

                    ;the sheep on the sx bank with the boat
                    (on-dx-s ?s)
                    (on-dx-boat)

                    ;it doesn't matter where the others are, I can carry the sheep

                )

    :effect (and 
                (not(on-dx-s ?s))
                (not(on-dx-boat))

                (on-sx-s ?s)
                (on-sx-boat)
            )
)

;--------------------------------------------------------------------------------------

(:action move-wolf-to-dx
    :parameters (?w -wolf ?s -sheep ?c -cabbage)
    :precondition(and 
                    ;the wolf on the sx bank with the boat
                    (on-sx-w ?w)
                    (on-sx-boat)

                    ;it can be moved if the sheep and cabbage are on opposite banks
                    (or
                        (and
                            (on-sx-s ?s)
                            (on-dx-c ?c)
                        )
                        (and
                            (on-dx-s ?s)
                            (on-sx-c ?c)
                        )
                    )

                )  


    :effect (and 
                (not(on-sx-w ?w))
                (not(on-sx-boat))

                (on-dx-w ?w)
                (on-dx-boat)
            )
)


(:action move-wolf-to-sx
    :parameters (?w -wolf ?s -sheep ?c -cabbage)
    :precondition(and 
                    ;the wolf on the dx bank with the boat
                    (on-dx-w ?w)
                    (on-dx-boat)

                    ;it can be moved if the sheep and cabbage are on opposite banks
                    (or
                        (and
                            (on-sx-s ?s)
                            (on-dx-c ?c)
                        )
                        (and
                            (on-dx-s ?s)
                            (on-sx-c ?c)
                        )
                    )

                )  


    :effect (and 
                (not(on-dx-w ?w))
                (not(on-dx-boat))

                (on-sx-w ?w)
                (on-sx-boat)
            )
)

;--------------------------------------------------------------------------------------

(:action move-cabbage-to-dx
    :parameters (?w -wolf ?s -sheep ?c -cabbage)
    :precondition(and 
                    ;the cabbage on the sx bank with the boat
                    (on-sx-c ?c)
                    (on-sx-boat)

                    ;it can be moved if the sheep and wolf are on opposite banks
                    (or
                        (and
                            (on-sx-s ?s)
                            (on-dx-w ?w)
                        )
                        (and
                            (on-dx-s ?s)
                            (on-sx-w ?w)
                        )
                    )

                )  

    :effect (and 
                (not(on-sx-c ?c))
                (not(on-sx-boat))

                (on-dx-c ?c)
                (on-dx-boat)
            )
)


(:action move-cabbage-to-sx
    :parameters (?w -wolf ?s -sheep ?c -cabbage)
    :precondition(and 
                    ;the cabbage on the sx bank with the boat
                    (on-dx-c ?c)
                    (on-dx-boat)

                    ;it can be moved if the sheep and wolf are on opposite banks
                    (or
                        (and
                            (on-sx-s ?s)
                            (on-dx-w ?w)
                        )
                        (and
                            (on-dx-s ?s)
                            (on-sx-w ?w)
                        )
                    )

                )  

    :effect (and 
                (not(on-dx-c ?c))
                (not(on-dx-boat))

                (on-sx-c ?c)
                (on-sx-boat)
            )
)

;--------------------------------------------------------------------------------------
(:action move-empty-boat-to-dx
    :parameters (?w -wolf ?s -sheep ?c -cabbage)
    :precondition(and 
                    ;to move the boat on the right you need the boat on the left
                    (on-sx-boat)

                    ;it can be moved if the sheep-wolf and the sheep-cabbage combinations are on opposite banks
                    (or 
                        ;different banks for sheep and wolf
                        (and
                            (on-sx-s ?s)
                            (on-dx-w ?w)
                        )
                        (and
                            (on-dx-s ?s)
                            (on-sx-w ?w)
                        )
                        
                        ;different banks for sheep and cabbage
                        (and
                            (on-sx-s ?s)
                            (on-dx-c ?c)
                        )
                        (and
                            (on-dx-s ?s)
                            (on-sx-c ?c)
                        )

                    )

                )  

    :effect (and 
                (not(on-sx-boat))

                (on-dx-boat)
            )
)

(:action move-empty-boat-to-sx
    :parameters (?w -wolf ?s -sheep ?c -cabbage)
    :precondition(and 
                    ;to move the boat on the right you need the boat on the left
                    (on-dx-boat)

                    ;it can be moved if the sheep-wolf and the sheep-cabbage combinations are on opposite banks
                    (or 
                        ;different banks for sheep and wolf
                        (and
                            (on-sx-s ?s)
                            (on-dx-w ?w)
                        )
                        (and
                            (on-dx-s ?s)
                            (on-sx-w ?w)
                        )
                        
                        ;different banks for sheep and cabbage
                        (and
                            (on-sx-s ?s)
                            (on-dx-c ?c)
                        )
                        (and
                            (on-dx-s ?s)
                            (on-sx-c ?c)
                        )

                    )

                )  

    :effect (and 
                (not(on-dx-boat))

                (on-sx-boat)
            )
)
)
