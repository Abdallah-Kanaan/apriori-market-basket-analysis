; ============================================================
; Projet LO12 - Partie CLIPS
; Systeme de recommandation avec plusieurs exemples de test
; ============================================================

; ------------------------------------------------------------
; 1. Structures utilisees
; ------------------------------------------------------------

(deftemplate basket
   (slot example)
   (slot item)
)

(deftemplate recommendation
   (slot example)
   (slot from)
   (slot item)
)

; ------------------------------------------------------------
; 2. Message de debut
; ------------------------------------------------------------

(defrule show_start
   (declare (salience 100))
   =>
   (printout t crlf)
   (printout t "==================== SYSTEME DE RECOMMANDATION ====================" crlf)
   (printout t "Ce fichier teste plusieurs paniers differents." crlf)
   (printout t "Chaque exemple montre quelles regles Apriori sont activees." crlf)
   (printout t "===================================================================" crlf)
   (printout t crlf)
)

; ------------------------------------------------------------
; 3. Affichage des paniers de test
; ------------------------------------------------------------

(defrule show_example_1
   (declare (salience 90))
   =>
   (printout t "EXEMPLE 1 : Panier avec whole_milk, yogurt, rolls_buns" crlf)
   (printout t "-------------------------------------------------------------------" crlf)
)

(defrule show_example_2
   (declare (salience 80))
   =>
   (printout t crlf)
   (printout t "EXEMPLE 2 : Panier avec root_vegetables, tropical_fruit" crlf)
   (printout t "-------------------------------------------------------------------" crlf)
)

(defrule show_example_3
   (declare (salience 70))
   =>
   (printout t crlf)
   (printout t "EXEMPLE 3 : Panier avec yogurt, tropical_fruit" crlf)
   (printout t "-------------------------------------------------------------------" crlf)
)

; ------------------------------------------------------------
; 4. Regles de recommandation
; Chaque regle signifie :
; Si le client achete X, alors on recommande Y.
; ------------------------------------------------------------

(defrule whole_milk_to_yogurt
   (basket (example ?ex) (item whole_milk))
   =>
   (assert (recommendation (example ?ex) (from whole_milk) (item yogurt)))
   (printout t "Exemple " ?ex " | Regle activee : whole_milk -> yogurt" crlf)
   (printout t "Explication : le panier contient whole_milk, donc on propose yogurt." crlf)
   (printout t crlf)
)

(defrule yogurt_to_other_vegetables
   (basket (example ?ex) (item yogurt))
   =>
   (assert (recommendation (example ?ex) (from yogurt) (item other_vegetables)))
   (printout t "Exemple " ?ex " | Regle activee : yogurt -> other_vegetables" crlf)
   (printout t "Explication : le panier contient yogurt, donc on propose other_vegetables." crlf)
   (printout t crlf)
)

(defrule rolls_buns_to_whole_milk
   (basket (example ?ex) (item rolls_buns))
   =>
   (assert (recommendation (example ?ex) (from rolls_buns) (item whole_milk)))
   (printout t "Exemple " ?ex " | Regle activee : rolls_buns -> whole_milk" crlf)
   (printout t "Explication : le panier contient rolls_buns, donc on propose whole_milk." crlf)
   (printout t crlf)
)

(defrule root_vegetables_to_other_vegetables
   (basket (example ?ex) (item root_vegetables))
   =>
   (assert (recommendation (example ?ex) (from root_vegetables) (item other_vegetables)))
   (printout t "Exemple " ?ex " | Regle activee : root_vegetables -> other_vegetables" crlf)
   (printout t "Explication : le panier contient root_vegetables, donc on propose other_vegetables." crlf)
   (printout t crlf)
)

(defrule tropical_fruit_to_whole_milk
   (basket (example ?ex) (item tropical_fruit))
   =>
   (assert (recommendation (example ?ex) (from tropical_fruit) (item whole_milk)))
   (printout t "Exemple " ?ex " | Regle activee : tropical_fruit -> whole_milk" crlf)
   (printout t "Explication : le panier contient tropical_fruit, donc on propose whole_milk." crlf)
   (printout t crlf)
)

; ------------------------------------------------------------
; 5. Plusieurs paniers de test
; ------------------------------------------------------------

(deffacts test_baskets

   ; Exemple 1
   (basket (example 1) (item whole_milk))
   (basket (example 1) (item yogurt))
   (basket (example 1) (item rolls_buns))

   ; Exemple 2
   (basket (example 2) (item root_vegetables))
   (basket (example 2) (item tropical_fruit))

   ; Exemple 3
   (basket (example 3) (item yogurt))
   (basket (example 3) (item tropical_fruit))
)

; ------------------------------------------------------------
; 6. Message de fin
; ------------------------------------------------------------

(defrule show_end
   (declare (salience -100))
   =>
   (printout t "===================================================================" crlf)
   (printout t "Fin des tests." crlf)
   (printout t "Chaque ligne indique l'exemple, la regle activee et la recommandation." crlf)
   (printout t "===================================================================" crlf)
   (printout t crlf)
)

; ------------------------------------------------------------
; Commandes a executer dans CLIPS :
; (load "apriori_rules_multiple_examples.clp")
; (reset)
; (run)
; ------------------------------------------------------------