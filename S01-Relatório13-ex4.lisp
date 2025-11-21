;;; 1. Estrutura ocorrencia

(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)


;;; 2. Função recursiva para somar nivel-medo

(defun soma-medo-recursiva (lista-ocorrencias)
  (if (null lista-ocorrencias)
      0
      (+ (ocorrencia-nivel-medo (first lista-ocorrencias))
         (soma-medo-recursiva (rest lista-ocorrencias)))))


;;; 3. Função principal (analise-final)

(defun analise-final (lista-ocorrencias)
  (let* ((total-medo (soma-medo-recursiva lista-ocorrencias))
         (qtde (length lista-ocorrencias))
         (media (/ total-medo qtde)))   ;; média do nível de medo
         
    ;; filtra apenas as ocorrências críticas
    (mapcar
     #'ocorrencia-nome
     (remove-if-not
      (lambda (o)
        (and (> (ocorrencia-agentes-enviados o) 3)
             (> (ocorrencia-nivel-medo o) media)))
      lista-ocorrencias))))


;;; ------------------------------
;;; TESTE FINAL
;;; ------------------------------

(setq ocorrencias-teste
      (list
       (make-ocorrencia :nome "Ritual da Névoa"
                        :ritual "Invocação"
                        :nivel-medo 30
                        :agentes-enviados 2)

       (make-ocorrencia :nome "Sussurros na Cripta"
                        :ritual "Necromancia"
                        :nivel-medo 80
                        :agentes-enviados 5)

       (make-ocorrencia :nome "O Chamado do Lago"
                        :ritual "Abissal"
                        :nivel-medo 60
                        :agentes-enviados 4)

       (make-ocorrencia :nome "Sombras do Farol"
                        :ritual "Ilusório"
                        :nivel-medo 20
                        :agentes-enviados 1)

       (make-ocorrencia :nome "Entidade de Aço"
                        :ritual "Tecnognose"
                        :nivel-medo 90
                        :agentes-enviados 6)))


;; Executar a análise:
(analise-final ocorrencias-teste)
