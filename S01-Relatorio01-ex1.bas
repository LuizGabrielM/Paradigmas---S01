
CLS
DIM nota1 AS SINGLE, nota2 AS SINGLE, nota3 AS SINGLE
DIM media AS SINGLE

PRINT "Digite a primeira nota: ";
INPUT nota1
PRINT "Digite a segunda nota: ";
INPUT nota2

media = (nota1 + nota2) / 2

PRINT "Média = "; media

IF media > 60 THEN
    PRINT "Aprovado direto"
ELSEIF media < 30 THEN
    PRINT "Reprovado direto"
ELSE
    PRINT "Insira a nota da NP3: ";
    INPUT nota3
    media = (nota1 + nota2 + nota3) / 3
    PRINT "Nova média = "; media

    IF media > 50 THEN
        PRINT "Aprovado pela NP3"
    ELSE
        PRINT "Reprovado na NP3"
    END IF
END IF

END










ex 2

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
