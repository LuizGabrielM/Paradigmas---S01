data Banda = Banda
  { nomeBanda :: String
  , genero    :: String
  , cache     :: Double
  } deriving (Show)

data Status = Ativo | Encerrado | Cancelado
  deriving (Show, Eq)

data Evento = Evento
  { bandas :: [Banda]
  , status :: Status
  } deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0
custoTotalEvento (Evento bs _) =
  let total = sum (map cache bs)
  in total * 1.20

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda para abrir o evento."
bandaAbertura (Evento (b:_) _) = nomeBanda b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda para encerrar o evento."
bandaEncerramento (Evento bs _) = nomeBanda (last bs)

rockers :: Banda
rockers = Banda "The Rockers" "Rock" 5000

synthwave :: Banda
synthwave = Banda "Neon Dreams" "Synthwave" 3500

metal :: Banda
metal = Banda "Iron Skull" "Metal" 7000

popstar :: Banda
popstar = Banda "Luna Pop" "Pop" 6000

eventoAtivo :: Evento
eventoAtivo = Evento [rockers, synthwave, metal] Ativo

eventoEncerrado :: Evento
eventoEncerrado = Evento [popstar, synthwave] Encerrado

eventoCancelado :: Evento
eventoCancelado = Evento [rockers, popstar, metal] Cancelado

main :: IO ()
main = do
  putStrLn "=== Evento Ativo ==="
  print eventoAtivo
  putStrLn ("Custo total: " ++ show (custoTotalEvento eventoAtivo))
  putStrLn ("Abertura: " ++ bandaAbertura eventoAtivo)
  putStrLn ("Encerramento: " ++ bandaEncerramento eventoAtivo)

  putStrLn "\n=== Evento Encerrado ==="
  print eventoEncerrado
  putStrLn ("Custo total: " ++ show (custoTotalEvento eventoEncerrado))
  putStrLn ("Abertura: " ++ bandaAbertura eventoEncerrado)
  putStrLn ("Encerramento: " ++ bandaEncerramento eventoEncerrado)

  putStrLn "\n=== Evento Cancelado ==="
  print eventoCancelado
  putStrLn ("Custo total: " ++ show (custoTotalEvento eventoCancelado))
  putStrLn ("Abertura: " ++ bandaAbertura eventoCancelado)
  putStrLn ("Encerramento: " ++ bandaEncerramento eventoCancelado)
