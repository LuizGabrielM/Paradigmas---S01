% --- Fatos de Exemplo ---

disciplina(calculo_i, 6, matematica).
disciplina(algebra_linear, 5, matematica).
disciplina(programacao_funcional, 4, computacao).
disciplina(introducao_eng, 2, geral).
disciplina(calculo_ii, 6, matematica).
disciplina(estrutura_dados, 4, computacao).
disciplina(fisica_i, 4, fisica).
disciplina(analise_algoritmos, 4, computacao).
disciplina(logica, 7, matematica). 

prerequisito(calculo_ii, calculo_i).
prerequisito(fisica_i, calculo_i).
prerequisito(analise_algoritmos, estrutura_dados).
prerequisito(calculo_iii, calculo_ii).
prerequisito(equacoes_diferenciais, calculo_ii).
prerequisito(topicos_mat_avancada, logica).
prerequisito(teoria_grafos, logica).
prerequisito(algebra_abstrata, logica).

% --- 1. Regra: alto_impacto(D) ---

alto_impacto(D) :-
    disciplina(D, Creditos, _),
    Creditos > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

% --- 2. Regra Auxiliar para a Query: find_disciplinas_especificas(D) ---

find_disciplinas_especificas(D) :-
    disciplina(D, 4, matematica),
    \+ prerequisito(_, D).
