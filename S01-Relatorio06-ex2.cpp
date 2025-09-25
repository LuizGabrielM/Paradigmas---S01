#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    
    Pessoa(string n, int i) {
        nome = n;
        idade = i;
    }

    string getNome() { return nome; }
    int getIdade() { return idade; }

    void setNome(string n) { nome = n; }
    void setIdade(int i) { idade = i; }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int lvl) : Pessoa(n, i) {
        nivel = lvl;
    }

    int getNivel() { return nivel; }
    void setNivel(int lvl) { nivel = lvl; }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i) {
        if (r >= 0 && r <= 10)
            rank = r;
        else
            rank = 0;
    }

    int getRank() { return rank; }
    void setRank(int r) {
        if (r >= 0 && r <= 10)
            rank = r;
    }
};

int main() {
    Protagonista hero("Ren Amamiya", 17, 5);

    Personagem ally("Ryuji Sakamoto", 17, 3);

    cout << "=== Protagonista ===" << endl;
    cout << "Nome: " << hero.getNome() << endl;
    cout << "Idade: " << hero.getIdade() << endl;
    cout << "Nivel: " << hero.getNivel() << endl;

    cout << "\n=== Aliado ===" << endl;
    cout << "Nome: " << ally.getNome() << endl;
    cout << "Idade: " << ally.getIdade() << endl;
    cout << "Rank: " << ally.getRank() << endl;

    return 0;
}
