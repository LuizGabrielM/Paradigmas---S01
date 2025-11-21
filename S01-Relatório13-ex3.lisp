;;;; 1. Estrutura item e catálogo inicial

(defstruct item
  nome
  tipo
  preco
  forca-magica)

(setq catalogo
      (list
       (make-item :nome "Espada Sombria"
                  :tipo "Arma"
                  :preco 200
                  :forca-magica 90)

       (make-item :nome "Adaga Envenenada"
                  :tipo "Arma"
                  :preco 120
                  :forca-magica 40)

       (make-item :nome "Poção da Lua"
                  :tipo "Pocao"
                  :preco 60
                  :forca-magica 30)

       (make-item :nome "Orbe do Caos"
                  :tipo "Artefato"
                  :preco 500
                  :forca-magica 150)))


;;;; 2. Funções puras de transformação

(defun adiciona-imposto (preco)
  (* preco 1.15))  ;; aumenta preço em 15%

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))


;;;; 3. Função processa-venda

(defun processa-venda (catalogo)
  (let* ((apenas-armas
           (remove-if-not
            (lambda (i)
              (string-equal (item-tipo i) "Arma"))
            catalogo))

         ;; 1ª transformação: aumentar preço
         (armas-com-preco-ajustado
           (mapcar
            (lambda (i)
              (make-item
               :nome (item-nome i)
               :tipo (item-tipo i)
               :preco (adiciona-imposto (item-preco i))
               :forca-magica (item-forca-magica i)))
            apenas-armas)))

    ;; 2ª transformação: retornar relatório final
    (mapcar
     (lambda (i)
       (list (item-nome i)
             (bonus-maldicao (item-forca-magica i))))
     armas-com-preco-ajustado)))
