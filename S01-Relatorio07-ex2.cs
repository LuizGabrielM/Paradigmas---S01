using System;
using System.Collections.Generic;

namespace PokemonGame
{
    // 1️⃣ Classe base
    class Pokemon
    {
        public string Nome { get; set; }

        public Pokemon(string nome)
        {
            Nome = nome;
        }

        public virtual void Atacar()
        {
            Console.WriteLine($"{Nome} realiza um ataque genérico!");
        }
    }

    class PokemonDeFogo : Pokemon
    {
        public PokemonDeFogo(string nome) : base(nome) { }

        public override void Atacar()
        {
            Console.WriteLine($"{Nome} lança uma rajada de fogo! 🔥");
        }
    }

    class PokemonDeAgua : Pokemon
    {
        public PokemonDeAgua(string nome) : base(nome) { }

        public override void Atacar()
        {
            Console.WriteLine($"{Nome} lança um jato de água! 💧");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<Pokemon> listaDePokemons = new List<Pokemon>();

            listaDePokemons.Add(new PokemonDeFogo("Charizard"));
            listaDePokemons.Add(new PokemonDeAgua("Blastoise"));

            foreach (Pokemon p in listaDePokemons)
            {
                p.Atacar();
            }

            Console.ReadLine();
        }
    }
}
