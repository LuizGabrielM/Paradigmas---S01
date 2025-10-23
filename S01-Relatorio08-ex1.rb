
class Musico
  attr_accessor :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "O método tocar_partitura deve ser implementado nas subclasses!"
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    puts "#{@nome}, o pianista, toca a peça '#{peca}' com o som suave do #{@instrumento}."
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    puts "#{@nome}, o violinista, interpreta '#{peca}' com emoção em seu #{@instrumento}."
  end
end

class Maestro
  attr_accessor :musicos

  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "\n O maestro inicia o ensaio da peça '#{peca}'!\n\n"
    @musicos.each do |musico|
      musico.tocar_partitura(peca)
    end
  end

  def mudar_foco(estado)
    puts "\n Mudando o foco dos músicos...\n\n"
    mensagens = @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end

    mensagens.each { |msg| puts msg }
    mensagens
  end
end


musicos = [
  Pianista.new("Kousei", "piano"),
  Violinista.new("Kaori", "violino")
]


maestro = Maestro.new(musicos)


print "Digite o nome da peça a ser tocada: "
peca = gets.chomp

maestro.iniciar_ensaio(peca)


print "\nDefina o novo estado dos músicos (ex: Concentrado, Relaxado, Inspirado): "
estado = gets.chomp

maestro.mudar_foco(estado)
