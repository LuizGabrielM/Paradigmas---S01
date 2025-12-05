% --- Fatos de Exemplo (Adicione ou modifique conforme sua base de dados) ---

% disciplina(Nome, Area)
disciplina(calculo_i, fundamental).
disciplina(algebra_linear, fundamental).
disciplina(programacao_i, fundamental).
disciplina(estrutura_dados, computacao).
disciplina(algoritmos, computacao).
disciplina(inteligencia_artificial, computacao).

% concluido(Aluno, Disciplina)
concluido(joao, calculo_i).
concluido(joao, programacao_i).
concluido(maria, calculo_i).
concluido(maria, algebra_linear).
concluido(maria, estrutura_dados).
concluido(pedro, calculo_i).
concluido(pedro, programacao_i).
concluido(pedro, estrutura_dados).
concluido(pedro, algoritmos).

% prerequisito(DisciplinaQueExige, DisciplinaNecessaria)
prerequisito(estrutura_dados, programacao_i).
prerequisito(algoritmos, estrutura_dados).
prerequisito(inteligencia_artificial, algoritmos).
prerequisito(inteligencia_artificial, algebra_linear). % IA exige 2 pre-requisitos
prerequisito(calculo_ii, calculo_i).
prerequisito(mecanica, calculo_i).

% --- 1. Regra Auxiliar: falta_concluir(Aluno, Disciplina) ---

% Verdadeira SE a Disciplina for um pré-requisito de *alguma* matéria
% E o Aluno *não* a tenha concluído.
falta_concluir(Aluno, Disciplina) :-
    % Garante que Disciplina seja um pré-requisito para outra matéria (X)
    prerequisito(X, Disciplina),
    % Garante que o Aluno NÃO tenha concluído a Disciplina
    \+ concluido(Aluno, Disciplina).

% --- 2. Regra (Alvo Principal): aluno_apto(Aluno, Disciplina) ---

% Verdadeira SE a Disciplina NÃO for 'fundamental'
% E o aluno tiver concluído TODOS os seus pré-requisitos diretos.
aluno_apto(Aluno, Disciplina) :-
    % 1. A Disciplina NÃO é 'fundamental'
    disciplina(Disciplina, Area),
    Area \= fundamental,
    % 2. O aluno concluiu TODOS os seus pré-requisitos diretos.
    % Usamos a negação da negação (dupla negação) para expressar 'todos'.
    % Não existe um pré-requisito (PreReq) para a Disciplina
    % QUE o aluno AINDA NÃO tenha concluído.
    \+ (
        prerequisito(Disciplina, PreReq), % Se existe um pré-requisito (PreReq)
        \+ concluido(Aluno, PreReq)       % E o aluno NÃO o concluiu, falha
    ).
    % Nota: Se a Disciplina não tiver pré-requisitos, a negação de 'prerequisito(Disciplina, PreReq)'
    % também garante que a regra seja verdadeira, desde que a área não seja 'fundamental'.
