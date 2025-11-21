;; 1. Função pura: calcula-dosagem
(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20))
     10)
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20))
     25)
    (t
     50)))

;; 2. Função pura: ajusta-preco
(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ((string-equal nome-da-erva "Ginseng")
     (* preco-base 3.0))
    ((string-equal nome-da-erva "Lótus")
     (* preco-base 1.5))
    (t
     preco-base)))

;; 3. Preço final para paciente de 14 anos e 60 kg usando "Lótus"
(let* ((dosagem (calcula-dosagem 60 14))
       (preco-base 10)
       (preco-ajustado (ajusta-preco preco-base "Lótus"))
       (preco-final (* dosagem preco-ajustado)))
  (format t "Dosagem: ~a ml~%Preço por ml ajustado: ~a~%Preço final: ~a moedas~%"
          dosagem preco-ajustado preco-final))
