// Classe base
class Pokemon {
  #vida; // atributo protegido (privado)
  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
    console.log(`${this.nome} recebeu ${dano} de dano. Vida atual: ${this.#vida}`);
  }

  atacar(alvo) {
    console.log(`${this.nome} atacou ${alvo.nome}, mas sem efeito especial.`);
  }
}

// Subclasse Pokémon de Fogo
class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 10 + this.bonusAtaque;
    console.log(`${this.nome} lança uma bola de fogo em ${alvo.nome}!`);
    alvo.receberDano(dano);
  }
}

// Subclasse Pokémon de Água
class PokemonAgua extends Pokemon {
  #curaBase;
  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    const dano = 8;
    console.log(`${this.nome} lança um jato d’água em ${alvo.nome}!`);
    alvo.receberDano(dano);

    // cura após o ataque
    console.log(`${this.nome} se cura em ${this.#curaBase} pontos de vida.`);
    this.#curar(this.#curaBase);
  }

  #curar(valor) {
    // método privado interno
    let novaVida = this.getVida() + valor;
    console.log(`${this.nome} agora tem ${novaVida} de vida.`);
  }
}

// Demonstração de uso
const charmander = new PokemonFogo("Charmander", 50, 5);
const squirtle = new PokemonAgua("Squirtle", 55, 3);

console.log("=== Início da Batalha ===");
charmander.atacar(squirtle);
squirtle.atacar(charmander);
charmander.atacar(squirtle);
