CLS
RANDOMIZE TIMER   ' inicializa o gerador de números aleatórios

DIM numeroSecreto AS INTEGER
DIM palpite AS INTEGER

numeroSecreto = INT(RND * 101)   ' gera número entre 0 e 100

PRINT "Jogo de Adivinhação!"
PRINT "Tente adivinhar o número de 0 a 100."

DO
    PRINT
    INPUT "Digite seu palpite: ", palpite

    IF palpite < numeroSecreto THEN
        PRINT "O numero secreto eh MAIOR que "; palpite
    ELSEIF palpite > numeroSecreto THEN
        PRINT "O numero secreto eh MENOR que "; palpite
    ELSE
        PRINT "Parabens! Voce acertou o numero: "; numeroSecreto
    END IF
LOOP UNTIL palpite = numeroSecreto

END
