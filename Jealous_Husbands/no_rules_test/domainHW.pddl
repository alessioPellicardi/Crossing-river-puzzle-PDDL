;Header and description

(define (domain new_domain_hw)

;remove requirements that are not needed

(:types ;todo: enumerate twpes and their hierarchw here, e.g. car truck bus - vehicle
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


;Per muovere la coppia devono essere sulla stessa sponda
;prendi h e w solo se sono una coppia
(:action move-couple-to-dx
    :parameters (?h - husband ?w - wife)
    :precondition (and  
                    (on-sx-h ?h)
                    (on-sx-w ?w)
                    (on-sx-boat)
                    (couple ?h ?w) ;definisco nel problem couple
                )

    :effect (and 
                (on-dx-h ?h)
                (on-dx-w ?w)
                (on-dx-boat )

                (not (on-sx-h ?h))
                (not (on-sx-w ?w))
                (not(on-sx-boat ))
            )
)


(:action move-couple-to-sx
    :parameters (?h - husband ?w - wife)
    :precondition (and  
                    (on-dx-h ?h)
                    (on-dx-w ?w)
                    (on-dx-boat )
                    (couple ?h ?w) ;definisco nel problem couple
                )

    :effect (and 
                (on-sx-h ?h)
                (on-sx-w ?w)
                (on-sx-boat )

                (not (on-dx-h ?h))
                (not (on-dx-w ?w))
                (not(on-dx-boat ))
            )
)



;-------------------------------------------------------------------------------------
(:action move-husbands-to-dx
    :parameters (?h1 ?h2 -husband)
    :precondition (and

                    ;i mariti e la barca devono essere sulla stessa sponda  
                    (on-sx-h ?h1)
                    (on-sx-h ?h2)
                    (on-sx-boat )

                )

    :effect (and 
                (on-dx-h ?h1)
                (on-dx-h ?h2)
                (on-dx-boat )

                (not (on-sx-h ?h1))
                (not (on-sx-h ?h2))
                (not(on-sx-boat ))
            )
)

(:action move-husbands-to-sx
    :parameters (?h1 ?h2 -husband)
    :precondition (and

                    ;i mariti e la barca devono essere sulla stessa sponda  
                    (on-dx-h ?h1)
                    (on-dx-h ?h2)
                    (on-dx-boat )

                )

    :effect (and 
                (on-sx-h ?h1)
                (on-sx-h ?h2)
                (on-sx-boat )

                (not (on-dx-h ?h1))
                (not (on-dx-h ?h2))
                (not(on-dx-boat ))
            )
)

;-------------------------------------------------------------------------------------
(:action move-wives-to-dx
    :parameters (?w1 ?w2 -wife)
    :precondition (and

                    ;i mariti e la barca devono essere sulla stessa sponda  
                    (on-sx-w ?w1)
                    (on-sx-w ?w2)
                    (on-sx-boat )

                )

    :effect (and 
                (on-dx-w ?w1)
                (on-dx-w ?w2)
                (on-dx-boat )

                (not (on-sx-w ?w1))
                (not (on-sx-w ?w2))
                (not(on-sx-boat ))
            )
)

(:action move-wives-to-sx
    :parameters (?w1 ?w2 -wife)
    :precondition (and

                    ;i mariti e la barca devono essere sulla stessa sponda  
                    (on-dx-w ?w1)
                    (on-dx-w ?w2)
                    (on-dx-boat )

                )

    :effect (and 
                (on-sx-w ?w1)
                (on-sx-w ?w2)
                (on-sx-boat )

                (not (on-dx-w ?w1))
                (not (on-dx-w ?w2))
                (not(on-dx-boat ))
            )
)

;-------------------------------------------------------------------------------------
(:action move-husband-to-dx
    :parameters (?h1 -husband)
    :precondition (and

                    ;i mariti e la barca devono essere sulla stessa sponda  
                    (on-sx-h ?h1)
                    (on-sx-boat )

                )

    :effect (and 
                (on-dx-h ?h1)
                (on-dx-boat )

                (not (on-sx-h ?h1))
                (not(on-sx-boat ))
            )
)

(:action move-husband-to-sx
    :parameters (?h1 -husband)
    :precondition (and

                    ;i mariti e la barca devono essere sulla stessa sponda  
                    (on-dx-h ?h1)
                    (on-dx-boat )

                )

    :effect (and 
                (on-sx-h ?h1)
                (on-sx-boat )

                (not (on-dx-h ?h1))
                (not(on-dx-boat ))
            )
)


;-------------------------------------------------------------------------------------
(:action move-wife-to-dx
    :parameters (?w1 -wife)
    :precondition (and

                    ;i mariti e la barca devono essere sulla stessa sponda  
                    (on-sx-w ?w1)
                    (on-sx-boat )

                )

    :effect (and 
                (on-dx-w ?w1)
                (on-dx-boat )

                (not (on-sx-w ?w1))
                (not(on-sx-boat ))
            )
)

(:action move-wife-to-sx
    :parameters (?w1 -wife)
    :precondition (and

                    ;i mariti e la barca devono essere sulla stessa sponda  
                    (on-dx-w ?w1)
                    (on-dx-boat )

                )

    :effect (and 
                (on-sx-w ?w1)
                (on-sx-boat )

                (not (on-dx-w ?w1))
                (not(on-dx-boat ))
            )
)

)
