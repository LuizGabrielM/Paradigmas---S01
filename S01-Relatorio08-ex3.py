class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano

    def __str__(self):
        return f"{self.nome} (Dano: {self.dano})"


class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} - Arma: {self.arma}"


class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo("Faca", 75)

        self.equipe = equipe

    def mostrar_equipe(self):
        print("=== Equipe Phantom Thieves ===")
        print(f"Joker: usa {self.arma}")
        print("Membros do time:")
        for membro in self.equipe:
            print(f" - {membro}")


def main():
    ann = PhantomThieves("Ann Takamaki", "Chicote")
    ryuji = PhantomThieves("Ryuji Sakamoto", "Taco de beisebol")
    morgana = PhantomThieves("Morgana", "Estilingue")

    equipe_joker = [ann, ryuji, morgana]
    joker = Joker(equipe_joker)

    joker.mostrar_equipe()


if __name__ == "__main__":
    main()
