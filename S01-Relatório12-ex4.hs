data Tipo = Banho | Massagem | Banquete deriving (Show, Eq)

data Servico = Servico {
    nome :: String,
    tipo :: Tipo,
    preco :: Double
} deriving (Show)

data Status = EmAndamento | Finalizado | Cancelado deriving (Show, Eq)

data Atendimento = Atendimento {
    servicos :: [Servico],
    status :: Status
} deriving (Show)

bonusEspiritual :: [Servico] -> Double
bonusEspiritual ss =
    let total = sum (map preco ss)
        bonus = if length ss > 3 then total * 0.25 else 0
        subtotal = total + bonus
        desconto = if subtotal > 500 then subtotal * 0.10 else 0
    in subtotal - desconto

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento at
    | status at == Cancelado = 0
    | otherwise = bonusEspiritual (servicos at)

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico at =
    case servicos at of
        [] -> ""
        (s:_) -> nome s ++ " - " ++ show (tipo s)

main :: IO ()
main = do
    let s1 = Servico "Banho Relaxante" Banho 120
    let s2 = Servico "Massagem Espiritual" Massagem 250
    let s3 = Servico "Banquete Real" Banquete 300
    let s4 = Servico "Banho Purificador" Banho 150

    let a1 = Atendimento [s1, s2] Finalizado
    let a2 = Atendimento [s1, s2, s3, s4] Finalizado
    let a3 = Atendimento [s3] Cancelado

    print (valorFinalAtendimento a1)
    print (valorFinalAtendimento a2)
    print (valorFinalAtendimento a3)

    putStrLn (descricaoPrimeiroServico a2)
