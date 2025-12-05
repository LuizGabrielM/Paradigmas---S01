% --- Fatos de Exemplo ---

disciplina(calculo_i, matematica).
disciplina(algebra_linear, matematica).
disciplina(programacao_i, computacao).
disciplina(estrutura_dados, computacao).
disciplina(algoritmos, computacao).
disciplina(inteligencia_artificial, computacao).
disciplina(fisica_i, fisica).

concluido(joao, programacao_i).
concluido(joao, estrutura_dados).

concluido(maria, calculo_i).
concluido(maria, algebra_linear).
concluido(maria, programacao_i).

concluido(pedro, estrutura_dados).
concluido(pedro, algoritmos).
concluido(pedro, fisica_i).

% --- 1. Regra de Especialista: especialista_comp(Aluno) ---

especialista_comp(Aluno) :-
    disciplina(D1, computacao),
    concluido(Aluno, D1),
    disciplina(D2, computacao),
    concluido(Aluno, D2),
    D1 \= D2.

% --- 2. Regra de Deficiência: deficiencia_mat(Aluno) ---

deficiencia_mat(Aluno) :-
    concluido(Aluno, _),
    \+ (
        disciplina(D, matematica),
        concluido(Aluno, D)
    ).

% --- Consulta ---

% Para encontrar a solução, use a query: especialista_comp(A), deficiencia_mat(A).
