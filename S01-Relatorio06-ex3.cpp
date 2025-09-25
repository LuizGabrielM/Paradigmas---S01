#include <iostream>
#include <string>
using namespace std;

class Pessoa {
protected:
    string nome;

public:
    // Construtor
    Pessoa(string n) : nome(n) {}

    virtual void apresentar() {
        cout << "Olá, meu nome é " << nome << " e eu sou uma pessoa." << endl;
    }
};

class Professor : public Pessoa {
private:
    string disciplina;

public:
    Professor(string n, string d) : Pessoa(n), disciplina(d) {}

    void apresentar() override {
        cout << "Olá, meu nome é " << nome 
             << " e eu sou um professor de " << disciplina << "." << endl;
    }
};

class Aluno : public Pessoa {
private:
    string curso;
    string matricula;

public:
    Aluno(string n, string c, string m) : Pessoa(n), curso(c), matricula(m) {}

    void apresentar() override {
        cout << "Olá, meu nome é " << nome 
             << " e eu sou um aluno de " << curso 
             << " (Matrícula: " << matricula << ")." << endl;
    }
};

int main() {
    Professor prof("Cysneiros", "Programação Orientada a Objetos");
    Aluno aluno("Luiz", "Engenharia de Software", "2025001");

    Pessoa* p1 = &prof;
    Pessoa* p2 = &aluno;

    cout << "=== Apresentações ===" << endl;
    p1->apresentar();
    p2->apresentar();

    return 0;
}
