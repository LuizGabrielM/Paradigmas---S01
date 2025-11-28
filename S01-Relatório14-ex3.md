irmaos_germanos(A, B) :-
    A \= B,                 
    filho(A, Pai),
    filho(B, Pai),
    filho(A, Mae),
    filho(B, Mae),
    Pai \= Mae.           
