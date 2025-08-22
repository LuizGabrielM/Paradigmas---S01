CLS
DIM celsius AS SINGLE
DIM kelvin AS SINGLE
DIM fahrenheit AS SINGLE

PRINT "Conversor de Temperatura"
PRINT
INPUT "Digite a temperatura em Celsius: ", celsius

kelvin = celsius + 273.15
fahrenheit = (celsius * 9 / 5) + 32

PRINT
PRINT "Temperatura em Celsius   : "; celsius
PRINT "Temperatura em Kelvin    : "; kelvin
PRINT "Temperatura em Fahrenheit: "; fahrenheit

END
