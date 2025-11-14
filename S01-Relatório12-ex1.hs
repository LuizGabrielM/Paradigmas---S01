-- Definição do tipo Bebida
data Bebida = Bebida
  { nome  :: String
  , tipo  :: String
  , preco :: Double
  } deriving (Show)

-- Status possíveis de um pedido
data Status = Aberto | Entregue | Cancelado
  deriving (Show, Eq)

-- Definição do tipo Pedido
data Pedido = Pedido
  { bebidas :: [Bebida]
  , status  :: Status
  } deriving (Show)

valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido bebidas Cancelado) = 0
valorTotalPedido (Pedido bebidas _) =
  let soma = sum (map preco bebidas)
  in soma + 5.0


primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nome b
