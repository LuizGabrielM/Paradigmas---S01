filho(zeus, cronos).
filho(zeus, reia).

filho(poseidon, cronos).
filho(poseidon, reia).

filho(hades, cronos).
filho(hades, reia).


dominio(zeus, ceu).
dominio(poseidon, mar).
dominio(hades, submundo).

divindade_olimpica(Deus) :-
    filho(Deus, cronos),
    dominio(Deus, Dominio),
    (Dominio = ceu ; Dominio = mar ; Dominio = submundo).
