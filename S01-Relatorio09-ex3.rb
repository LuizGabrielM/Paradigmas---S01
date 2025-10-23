class MicroondasUnidade
  def aquecer_por(segundos)
    puts " A unidade do micro-ondas está aquecendo por #{segundos} segundos..."
    sleep(1) 
    puts " Aquecimento concluído!"
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    " [#{@hora_envio}] Mensagem: #{@conteudo}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new 
    @dmails = []                    
  end

  def enviar_dmail
    puts "\n Enviando um novo D-Mail..."
    print "Digite o conteúdo da mensagem: "
    conteudo = gets.chomp

    print "Digite o horário de envio (ex: 10:30): "
    hora_envio = gets.chomp

    print "Defina o tempo de aquecimento (em segundos): "
    tempo = gets.chomp.to_i

    @unidade.aquecer_por(tempo)

    dmail = DMail.new(conteudo, hora_envio)
    @dmails << dmail

    puts " D-Mail enviado com sucesso às #{hora_envio}!"
  end

  def listar_dmails(horario_corte)
    puts "\n Listando D-Mails enviados após #{horario_corte}:"
    dmails_filtrados = @dmails.select do |dmail|
      dmail.hora_envio > horario_corte
    end

    if dmails_filtrados.empty?
      puts " Nenhum D-Mail encontrado após o horário especificado."
    else
      dmails_filtrados.each { |d| puts d }
    end
  end
end

# --- Main ---
telefone = TelefoneDeMicroondas.new

loop do
  puts "\n===  MENU TELEFONE DE MICROONDAS ==="
  puts "1. Enviar D-Mail"
  puts "2. Listar D-Mails após um horário"
  puts "3. Sair"
  print "Escolha uma opção: "
  opcao = gets.chomp.to_i

  case opcao
  when 1
    telefone.enviar_dmail
  when 2
    print "Digite o horário de corte (ex: 09:00): "
    horario = gets.chomp
    telefone.listar_dmails(horario)
  when 3
    puts " Encerrando sistema. Adeus!"
    break
  else
    puts " Opção inválida, tente novamente."
  end
end
