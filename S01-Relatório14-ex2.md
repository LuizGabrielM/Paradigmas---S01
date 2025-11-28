dominio(zeus, ceu).
dominio(zeus, raio).
dominio(poseidon, mar).
dominio(hades, submundo).
dominio(hades, riquezas).

habita(zeus, olimpo).
habita(poseidon, mar).
habita(hades, submundo).

% Verdadeira se:
% 1) O deus tiver pelo menos DOIS domínios associados
% 2) E habitar o 'olimpo'

    habita(Deus, olimpo),
    findall(D, dominio(Deus, D), ListaDominios),
    length(ListaDominios, N),
    N >= 2.
