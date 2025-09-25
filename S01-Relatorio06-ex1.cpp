#include <iostream>
#include <string>
using namespace std;

class Personagem {
private:
    string nome;
    int nivel;
    int dano;
    int vida;

public:
    Personagem(string n, int lvl, int d, int v) {
        nome = n;
        nivel = lvl;
        dano = d;
        vida = v;
    }

    void atacar(Personagem &alvo) {
        cout << nome << " ataca " << alvo.nome << " causando " << dano << " de dano!" << endl;
        alvo.vida -= dano;

        if (alvo.vida < 0) {
            alvo.vida = 0;
        }
    }

    void mostrarStatus() {
        cout << "Personagem: " << nome
             << " | Nivel: " << nivel
             << " | Dano: " << dano
             << " | Vida: " << vida << endl;
    }

    string getNome() { return nome; }
};

int main() {
    Personagem p1("Cavaleiro", 10, 30, 100);
    Personagem p2("Dagrão", 5, 15, 60);

    cout << "=== Status Inicial ===" << endl;
    p1.mostrarStatus();
    p2.mostrarStatus();
    cout << endl;

    int escolha;
    cout << "Quem deve atacar? (1 para " << p1.getNome() 
         << ", 2 para " << p2.getNome() << "): ";
    cin >> escolha;

    if (escolha == 1) {
        p1.atacar(p2);
    } else if (escolha == 2) {
        p2.atacar(p1);
    } else {
        cout << "Opcao invalida! Ninguem atacou." << endl;
    }

    cout << "\n=== Status Apos Combate ===" << endl;
    p1.mostrarStatus();
    p2.mostrarStatus();

    return 0;
}
