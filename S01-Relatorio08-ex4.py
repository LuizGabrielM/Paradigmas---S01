from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass


class Implante:
    def __init__(self, custo: int, funcao: str):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return f"Implante: {self.funcao} (Custo: {self.custo} créditos)"


class NetRunner(Cibernetico):
    def __init__(self, nome: str, custo_implante: int, funcao_implante: str):
        self.nome = nome
        # Composição: o NetRunner cria e gerencia o implante internamente
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"{self.nome} está realizando um hack com seu {self.implante.funcao} 💻")

    def __str__(self):
        return f"NetRunner {self.nome} possui {self.implante}"


class Faccao:
    def __init__(self, nome: str, membros: list[Cibernetico]):
        self.nome = nome
        self.membros = membros  # Agregação: recebe objetos já criados

    def coordenar_hacks(self):
        print(f"\n=== Fação {self.nome} iniciando ataque cibernético ===")
        for membro in self.membros:
            membro.realizar_hack()


def main():
    v = NetRunner("V", 2000, "Neural Link Mk.II")
    lucy = NetRunner("Lucy", 3500, "Interface Neural de Alta Velocidade")
    kiwi = NetRunner("Kiwi", 3000, "Implante de Controle Remoto")

    equipe = Faccao("The Mox", [v, lucy, kiwi])

    print("=== Membros da Faccao ===")
    for membro in equipe.membros:
        print(membro)

    equipe.coordenar_hacks()


if __name__ == "__main__":
    main()
