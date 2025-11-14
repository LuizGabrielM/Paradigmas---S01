data Item = Item
  { nome     :: String
  , categoria :: String
  , preco    :: Double
  } deriving (Show)

data CompraZelda = CompraZelda
  { itens :: [Item]
  } deriving (Show)


calculaDesconto :: [Item] -> Double
calculaDesconto lista =
  let total = sum (map preco lista)
  in if total > 200
        then total * 0.10
        else 0


valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda itens)
  | total > 200 = total - desconto
  | otherwise   = total + 15.0
  where
    total    = sum (map preco itens)
    desconto = calculaDesconto itens


espada :: Item
espada = Item "Espada Mestra" "Arma" 180.0

pocao :: Item
pocao = Item "Poção de Vida" "Poção" 30.0

escudo :: Item
escudo = Item "Escudo Hyliano" "Equipamento" 150.0

arco :: Item
arco = Item "Arco de Cavaleiro" "Arma" 90.0


compra1 :: CompraZelda
compra1 = CompraZelda [espada, pocao]  

compra2 :: CompraZelda
compra2 = CompraZelda [escudo]         

compra3 :: CompraZelda
compra3 = CompraZelda [arco, pocao]   


main :: IO ()
main = do
  putStrLn "=== Compra 1 ==="
  print compra1
  putStrLn ("Valor final: " ++ show (valorFinal compra1))

  putStrLn "\n=== Compra 2 ==="
  print compra2
  putStrLn ("Valor final: " ++ show (valorFinal compra2))

  putStrLn "\n=== Compra 3 ==="
  print compra3
  putStrLn ("Valor final: " ++ show (valorFinal compra3))
