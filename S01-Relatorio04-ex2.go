package main

import (
	"fmt"
)

func main() {
	var numero int
	fmt.Print("Digite um número: ")
	fmt.Scan(&numero)

	switch numero % 2 {
	case 0:
		fmt.Println("O número é par")
	default:
		fmt.Println("O número é ímpar")
	}
}
