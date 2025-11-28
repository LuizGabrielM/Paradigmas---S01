% Caso base: A é ancestral de D se A é progenitor direto (pai ou mãe) de D.
ancestral(A, D) :-
    filho(D, A).

% Caso recursivo: A é ancestral de D se A é progenitor de Z
% e Z é ancestral de D.
ancestral(A, D) :-
    filho(Z, A),
    ancestral(Z, D).
