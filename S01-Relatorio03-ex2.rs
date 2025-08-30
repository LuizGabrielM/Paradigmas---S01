use std::io;

// Função para verificar se é par
fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    // Jogador 1 escolhe par ou ímpar
    println!("Jogador 1, escolha 'par' ou 'ímpar':");
    let mut escolha = String::new();
    io::stdin()
        .read_line(&mut escolha)
        .expect("Erro ao ler escolha");
    let escolha = escolha.trim().to_lowercase(); // padroniza

    // Jogador 1 digita um número
    println!("Jogador 1, digite seu número (i32):");
    let mut entrada1 = String::new();
    io::stdin().read_line(&mut entrada1).expect("Erro");
    let numero1: i32 = entrada1.trim().parse().expect("Digite um número válido");

    // Jogador 2 digita um número
    println!("Jogador 2, digite seu número (i32):");
    let mut entrada2 = String::new();
    io::stdin().read_line(&mut entrada2).expect("Erro");
    let numero2: i32 = entrada2.trim().parse().expect("Digite um número válido");

    // Soma
    let soma = numero1 + numero2;

    // Verifica se a soma é par
    let soma_par = eh_par(soma);

    // Determina vencedor
    if (soma_par && escolha == "par") || (!soma_par && escolha == "ímpar") {
        println!("Soma = {} -> Jogador 1 venceu!", soma);
    } else {
        println!("Soma = {} -> Jogador 2 venceu!", soma);
    }
}
