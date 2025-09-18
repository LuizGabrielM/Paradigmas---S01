#include <iostream>
using namespace std;

int main() {
    int quantidade;
    cout << "Digite quantas notas deseja inserir: ";
    cin >> quantidade;

    float soma = 0.0;

    for (int i = 0; i < quantidade; i++) {
        float nota;
        cout << "Digite a nota " << i + 1 << ": ";
        cin >> nota;

        while (nota < 0 || nota > 10) {
            cout << "Nota invalida! Digite novamente (0 a 10): ";
            cin >> nota;
        }

        soma += nota; 
    }

    float media = soma / quantidade;

    cout << "Media final = " << media << end
