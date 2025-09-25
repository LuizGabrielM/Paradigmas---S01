#include <iostream>
#include <string>
#include <vector>
using namespace std;

class SerVivo {
protected:
    string nome;

public:
    SerVivo(string n) : nome(n) {}

    virtual void apresentar() {
        cout << "Eu sou um ser vivo chamado " << nome << "." << endl;
    }

    virtual ~SerVivo() {}
};

class Humano : public SerVivo {
public:
    Humano(string n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Olá, eu sou o humano " << nome << ", mestre das civilizações." << endl;
    }
};

class Elfo : public SerVivo {
public:
    Elfo(string n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Saudações, eu sou o elfo " << nome << ", guardião das florestas." << endl;
    }
};

class Fada : public SerVivo {
public:
    Fada(string n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Encantado! Eu sou a fada " << nome << ", portadora da magia." << endl;
    }
};

int main() {
    vector<SerVivo*> seres;

    seres.push_back(new Humano("Arthur"));
    seres.push_back(new Elfo("Legolas"));
    seres.push_back(new Fada("Luna"));

    cout << "=== Apresentações no mundo de fantasia ===" << endl;
    for (SerVivo* s : seres) {
        s->apresentar();
    }

    for (SerVivo* s : seres) {
        delete s;
    }

    return 0;
}
