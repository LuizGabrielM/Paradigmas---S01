area(calculo1, matematica).
area(calculo2, matematica).
area(calculo3, matematica).
area(algebra_linear, matematica).
area(prog1, computacao).
area(prog2, computacao).
area(ia, aplicacoes).
area(robotica, aplicacoes).

creditos(calculo1, 4).
creditos(calculo2, 4).
creditos(calculo3, 6).
creditos(algebra_linear, 4).
creditos(prog1, 4).
creditos(prog2, 4).
creditos(ia, 4).
creditos(robotica, 4).

prerequisito(calculo2, calculo1).
prerequisito(calculo3, calculo2).
prerequisito(prog2, prog1).
prerequisito(robotica, prog2).
prerequisito(ia, prog2).

disciplina_raiz(D) :-
    \+ prerequisito(_, D).

disciplina_folha(D) :-
    \+ prerequisito(D, _).

