#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho) {
    float soma = 0.0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i];
    }
    return soma;
}

int main() {
    int tamanho;

    cout << "Digite o tamanho do array: ";
    cin >> tamanho;

    float arr[tamanho];

    cout << "Digite os valores do array:\n";
    for (int i = 0; i < tamanho; i++) {
        cin >> arr[i];
    }

    float resultado = somarArray(arr, tamanho);

    cout << "A soma dos valores do array é: " << resultado << endl;

    return 0;
}
