
class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @_nome = nome
    self.preco_base = preco_base  
  end

  def preco_base
    @_preco_base
  end

  def preco_base=(valor)
    if valor.to_f > 0
      @_preco_base = valor.to_f
    else
      raise ArgumentError, "O preço deve ser positivo!"
    end
  end

  def preco_final
    @_preco_base
  end

  def to_s
    "Drink: #{@_nome} | Preço Base: R$#{'%.2f' % @_preco_base}"
  end
end

class DrinkLenda < Drink
  attr_reader :anos_desde_criacao

  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao.to_i
  end

  def preco_final
    preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
    "Drink Lenda: #{@_nome} | Anos: #{@anos_desde_criacao} | Preço Final: R$#{'%.2f' % preco_final}"
  end
end

class DrinkComum < Drink
  def to_s
    "Drink Comum: #{@_nome} | Preço Final: R$#{'%.2f' % preco_final}"
  end
end

puts "🍸 Bem-vindo ao Bar AfterLife! 🍸"
print "Digite o nome do drink: "
nome = gets.chomp

print "Digite o preço base do drink: R$"
preco = gets.chomp.to_f

print "Digite a idade do drink em anos (0 se for comum): "
anos = gets.chomp.to_i

if anos > 0
  drink = DrinkLenda.new(nome, preco, anos)
else
  drink = DrinkComum.new(nome, preco)
end

puts "\n Detalhes do pedido:"
puts drink.to_s

