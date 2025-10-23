
module Rastreavel
  def obter_localizacao(hora)
    puts "📍 Localização de #{nome} às #{hora}: #{@localizacao}"
  end
end

module Perigoso
  def calcular_risco
    raise NotImplementedError, "O método calcular_risco deve ser implementado pela classe que inclui este módulo."
  end
end



class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome)
    @nome = nome
    @localizacao = "Desconhecida"
  end

  def to_s
    "#{@nome} (#{self.class}) - Localização: #{@localizacao}"
  end
end


class Detetive < Participante
  include Rastreavel

  def investigar
    puts "🕵️ #{@nome} está investigando pistas..."
  end
end


class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def calcular_risco
    base_risco = @nome.length * 10
    puts "⚠️ Nível de risco de #{@nome}: #{base_risco}"
    base_risco
  end
end


class Cenario
  attr_accessor :participantes

  def initialize
    @participantes = []
  end

  def adicionar_participante(participante)
    @participantes << participante
  end

  def listar_participantes
    puts "\n🎭 Participantes no cenário:"
    @participantes.each { |p| puts "- #{p}" }
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
end


puts "===  JOGO DAS SOMBRAS ==="

sherlock = Detetive.new("Sherlock Holmes")
moriarty = MestreDoCrime.new("Moriarty")

print "Digite a localização atual de #{sherlock.nome}: "
sherlock.localizacao = gets.chomp

print "Digite a localização atual de #{moriarty.nome}: "
moriarty.localizacao = gets.chomp

cenario = Cenario.new
cenario.adicionar_participante(sherlock)
cenario.adicionar_participante(moriarty)

cenario.listar_participantes

puts "\n Rastreamento:"
sherlock.obter_localizacao("10:30")
moriarty.obter_localizacao("10:35")

puts "\n Identificando ameaças..."
ameacas = cenario.identificar_ameacas

if ameacas.empty?
  puts " Nenhum criminoso identificado."
else
  ameacas.each do |criminoso|
    puts " Alvo perigoso detectado: #{criminoso.nome}"
    criminoso.calcular_risco
  end
end

puts "\n Fim do jogo das sombras."
