using System;
using System.Collections.Generic;

namespace MundoDeFrieren
{
    class Feitico
    {
        public string Nome { get; set; }
        public string Efeito { get; set; }

        public Feitico(string nome, string efeito)
        {
            Nome = nome;
            Efeito = efeito;
        }
    }

    class Grimorio
    {
        private List<Feitico> feitiços = new List<Feitico>();

        public void AdicionarFeitico(Feitico f)
        {
            feitiços.Add(f);
        }

        public void ListarFeiticos()
        {
            Console.WriteLine(" Feitiços no Grimório:");
            foreach (var f in feitiços)
            {
                Console.WriteLine($"- {f.Nome}: {f.Efeito}");
            }
        }
    }

    class Ferramenta
    {
        public string Nome { get; set; }

        public Ferramenta(string nome)
        {
            Nome = nome;
        }
    }

    class Maga
    {
        public string Nome { get; set; }
        public Grimorio Grimorio { get; private set; } // composição
        public List<Ferramenta> Ferramentas { get; private set; } // agregação

        public Maga(string nome, List<Ferramenta> ferramentas)
        {
            Nome = nome;
            Grimorio = new Grimorio(); // criado internamente
            Ferramentas = ferramentas; // agregação 
        }

        public void MostrarFerramentas()
        {
            Console.WriteLine("🧰 Ferramentas de " + Nome + ":");
            foreach (var f in Ferramentas)
            {
                Console.WriteLine("- " + f.Nome);
            }
        }
    }

    //Programa principal
    class Program
    {
        static void Main(string[] args)
        {
            // (pode ser compartilhada)
            List<Ferramenta> ferramentas = new List<Ferramenta>()
            {
                new Ferramenta("Lanterna Mágica"),
                new Ferramenta("Corda de Elfa"),
                new Ferramenta("Mapa Antigo")
            };

            Maga frieren = new Maga("Frieren", ferramentas);

            frieren.Grimorio.AdicionarFeitico(new Feitico("Raio de Luz", "Emite um feixe intenso de luz"));
            frieren.Grimorio.AdicionarFeitico(new Feitico("Barreira Mágica", "Cria uma proteção invisível"));

            Console.WriteLine($" Maga: {frieren.Nome}");
            frieren.Grimorio.ListarFeiticos();
            Console.WriteLine();
            frieren.MostrarFerramentas();

            Console.ReadLine();
        }
    }
}
