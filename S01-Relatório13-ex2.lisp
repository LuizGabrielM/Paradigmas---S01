;;;; 1. Estrutura criatura
(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

;;;; 2. Catálogo inicial com 4 criaturas
(setq catalogo
      (list
       (make-criatura :nome "Peixe Safe Shallows"
                      :ambiente "Safe Shallows"
                      :periculosidade "Baixa"
                      :vida-media 5)

       (make-criatura :nome "Reaper Leviathan"
                      :ambiente "Open Ocean"
                      :periculosidade "Alta"
                      :vida-media 80)

       (make-criatura :nome "Crabsquid"
                      :ambiente "Deep"
                      :periculosidade "Média"
                      :vida-media 40)

       (make-criatura :nome "Ghost Leviathan Juvenile"
                      :ambiente "Deep"
                      :periculosidade "Alta"
                      :vida-media 100)))

;;;; 3. HOF: filtra criaturas NÃO-baixa periculosidade
(defun filtra-por-perigo (catalogo)
  (remove-if
   (lambda (c)
     (string-equal (criatura-periculosidade c) "Baixa"))
   catalogo))

;;;; 4. Relatório: criaturas Deep → strings formatadas
(defun relatorio-profundidade (catalogo)
  (mapcar
   (lambda (c)
     (format nil "~a: Vive em ~a"
             (criatura-nome c)
             (criatura-ambiente c)))
   ;; Filtra apenas ambiente Deep
   (remove-if-not
    (lambda (c)
      (string-equal (criatura-ambiente c) "Deep"))
    catalogo)))

