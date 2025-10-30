// Interface simulada para Hunters rastreáveis
class IRastreavel {
  rastrearLocal(latitude, longitude) {
    throw new Error("Método 'rastrearLocal()' deve ser implementado!");
  }
}

// Classe base Hunter
class Hunter extends IRastreavel {
  constructor(nome, localizacao, idade) {
    super();
    this.nome = nome;
    this.localizacao = localizacao;
    this.idade = idade;
  }

  // Implementação genérica (pode ser sobrescrita)
  rastrearLocal(latitude, longitude) {
    return `${this.nome} rastreando em [${latitude}, ${longitude}]...`;
  }
}

// Subclasse Especialista
class Especialista extends Hunter {
  constructor(nome, localizacao, idade, habilidadeNen) {
    super(nome, localizacao, idade);
    this.habilidadeNen = habilidadeNen;
  }

  rastrearLocal(latitude, longitude) {
    return ` Especialista ${this.nome} usa ${this.habilidadeNen} para rastrear em [${latitude}, ${longitude}]`;
  }
}

// Subclasse Manipulador
class Manipulador extends Hunter {
  constructor(nome, localizacao, idade, alvoAtual) {
    super(nome, localizacao, idade);
    this.alvoAtual = alvoAtual; // Pode ser outro Hunter
  }

  rastrearLocal(latitude, longitude) {
    const alvo = this.alvoAtual ? this.alvoAtual.nome : "alvo desconhecido";
    return ` Manipulador ${this.nome} manipula energia para localizar ${alvo} em [${latitude}, ${longitude}]`;
  }
}

// Classe Batalhão (agrega vários Hunters)
class Batalhao {
  #hunters; // atributo privado (Set de Hunters)

  constructor() {
    this.#hunters = new Set();
  }

  adicionarHunter(hunter) {
    // Garante que não existam duplicados (comparando pelo nome)
    for (const h of this.#hunters) {
      if (h.nome === hunter.nome) {
        console.log(` Hunter '${hunter.nome}' já está no batalhão.`);
        return;
      }
    }
    this.#hunters.add(hunter);
    console.log(` Hunter '${hunter.nome}' adicionado ao batalhão.`);
  }

  getNumHunters() {
    return this.#hunters.size;
  }

  iniciarRastreamento(lat, long) {
    console.log(`Iniciando rastreamento de ${this.#hunters.size} Hunters...`);
    const relatorios = [];

    for (const hunter of this.#hunters) {
      relatorios.push(hunter.rastrearLocal(lat, long));
    }

    return relatorios;
  }
}

// Demonstração de uso:

// Criando hunters
const gon = new Especialista("Gon Freecss", "Whale Island", 14, "Jajanken");
const kurapika = new Manipulador("Kurapika", "Yorknew City", 17, gon);
const hisoka = new Especialista("Hisoka", "Heaven’s Arena", 28, "Bungee Gum");

// Criando batalhão e adicionando hunters
const batalhao = new Batalhao();
batalhao.adicionarHunter(gon);
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(hisoka);
batalhao.adicionarHunter(gon); // tentativa duplicada

console.log("\n=== Rastreamento ===");
batalhao.iniciarRastreamento("-23.55", "-46.63").forEach(r => console.log(r));
