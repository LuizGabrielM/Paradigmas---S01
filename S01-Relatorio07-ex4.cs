using System;

namespace MasmorraDoTerror
{
    abstract class MonstroSombrio
    {
        public string Nome { get; set; }

        public MonstroSombrio(string nome)
        {
            Nome = nome;
        }

        public abstract void Mover(); 
    }

    class Zumbi : MonstroSombrio
    {
        public Zumbi(string nome) : base(nome) { }

        public override void Mover()
        {
            Console.WriteLine($"{Nome} se arrasta lentamente");
        }
    }

    class Espectro : MonstroSombrio
    {
        public Espectro(string nome) : base(nome) { }

        public override void Mover()
        {
            Console.WriteLine($"{Nome} desliza rapidamente pelas sombras! 👻");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            MonstroSombrio[] monstros = new MonstroSombrio[]
            {
                new Zumbi("Zumbi Lento"),
                new Espectro("Espectro Veloz")
            };

            foreach (MonstroSombrio monstro in monstros)
            {
                monstro.Mover();
            }

            Console.ReadLine();
        }
    }
}
