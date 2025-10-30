// "Interface" simulada para obrigar o comportamento de explorador
class IExplorador {
  explorarTerritorio() {
    throw new Error("Método 'explorarTerritorio()' deve ser implementado.");
  }
}

// Classe do equipamento ODM Gear (composição)
class ODM_Gear {
  constructor(modelo) {
    this.modelo = modelo;
    this._gasRestante = 100; // valor inicial de gás
  }

  usarGas(quantidade) {
    if (quantidade > this._gasRestante) {
      console.log(" Gás insuficiente!");
      this._gasRestante = 0;
    } else {
      this._gasRestante -= quantidade;
      console.log(` ODM Gear (${this.modelo}) usou ${quantidade} de gás.`);
    }
  }

  getGas() {
    return this._gasRestante;
  }
}

// Classe Soldado (implementa IExplorador e contém um ODM_Gear)
class Soldado extends IExplorador {
  #gear; // Composição (gear é parte do soldado)

  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.#gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.#gear.usarGas(20);
    return `${this.nome} está explorando o território usando ${this.#gear.modelo}.`;
  }

  verificarEquipamento() {
    return ` ${this.nome} possui ODM Gear modelo ${this.#gear.modelo} com ${this.#gear.getGas()}% de gás restante.`;
  }
}

// Classe Esquadrão (agrega vários Soldados)
class Esquadrao extends IExplorador {
  constructor(lider, membrosIniciais = []) {
    super();
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    if (soldado instanceof IExplorador) {
      this.membros.push(soldado);
      console.log(` ${soldado.nome} foi adicionado ao esquadrão.`);
    } else {
      console.log(` ${soldado.nome} não implementa IExplorador!`);
    }
  }

  explorarTerritorio() {
    console.log(` Esquadrão liderado por ${this.lider} iniciando exploração!`);
    return this.membros.map(m => m.explorarTerritorio());
  }

  relatarStatus() {
    return this.membros.map(m => m.verificarEquipamento());
  }
}

// Demonstração do funcionamento
const levi = new Esquadrao("Capitão Levi");

const eren = new Soldado("Eren Yeager", "Modelo-A");
const mikasa = new Soldado("Mikasa Ackerman", "Modelo-B");

levi.adicionarMembro(eren);
levi.adicionarMembro(mikasa);

console.log("\n=== Exploração Iniciada ===");
levi.explorarTerritorio().forEach(msg => console.log(msg));

console.log("\n=== Status dos Soldados ===");
levi.relatarStatus().forEach(status => console.log(status));
