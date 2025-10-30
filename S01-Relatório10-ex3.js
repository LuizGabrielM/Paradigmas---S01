// Classe Criatura
class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

// Classe Diário (composta dentro do Protagonista)
class Diario {
  #autorSecreto; // atributo privado

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map(); // número -> texto do enigma
    this.criaturasAviatadas = []; // lista de criaturas observadas
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
    console.log(` Enigma ${num} adicionado ao diário.`);
  }

  adicionarCriatura(criatura) {
    this.criaturasAviatadas.push(criatura);
    console.log(`👁️ Criatura ${criatura.nome} registrada no diário.`);
  }

  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return " Acesso negado! Autor incorreto.";
    }

    const enigma = this.enigmas.get(num);
    if (!enigma) {
      return " Enigma não encontrado.";
    }

    return ` Enigma ${num} decodificado: ${enigma}`;
  }
}

// Classe Personagem
class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

// Classe Protagonista (herda de Personagem e possui um Diário)
class Protagonista extends Personagem {
  constructor(nome, idade, autor) {
    super(nome, idade);
    this.diario = new Diario(autor);
  }
}

// Classe CabanaMistério (agrega personagens)
class CabanaMisterio {
  constructor(dono) {
    this.dono = dono; // o protagonista
    this.funcionarios = [];
    this.visitantes = [];
  }

  adicionarFuncionario(personagem) {
    this.funcionarios.push(personagem);
    console.log(` ${personagem.nome} contratado na Cabana do Mistério.`);
  }

  listarFuncionarios() {
    return this.funcionarios;
  }
}

// Demonstração do funcionamento

// Criando o protagonista e o diário
const dipper = new Protagonista("Dipper Pines", 12, "dipper_secret");

// Adicionando enigmas e criaturas
dipper.diario.adicionarEnigma(1, "A criatura da floresta só aparece à meia-noite.");
dipper.diario.adicionarEnigma(2, "A marca do demônio está nas paredes.");
dipper.diario.adicionarCriatura(new Criatura("Gnomos", false));

// Tentando decodificar com chave errada
console.log(dipper.diario.decodificar("errada", 1));

// Decodificando corretamente
console.log(dipper.diario.decodificar("dipper_secret", 1));

// Criando a Cabana Mistério
const cabana = new Cabana
