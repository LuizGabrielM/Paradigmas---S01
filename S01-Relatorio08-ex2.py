from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

    def __str__(self):
        return f"{self.nome} ({self.funcao})"


class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} ativa sua barreira massiva para proteger os aliados! ️")


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} dispara uma rajada devastadora contra os inimigos! ")


def main():
    herois = [
        Tanque("Reinhardt"),
        Dano("Soldado: 76"),
        Tanque("D.Va"),
        Dano("Hanzo")
    ]

    print("=== Overwatch: Ultimates Ativadas ===\n")
    for heroi in herois:
        print(heroi)
        heroi.usar_ultimate()
        print("-" * 50)


if __name__ == "__main__":
    main()
