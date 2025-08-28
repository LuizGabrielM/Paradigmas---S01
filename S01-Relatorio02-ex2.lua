function maiorNumero(array)
    local maior = array[1]  
    for i = 2, #array do
        if array[i] > maior then
            maior = array[i]
        end
    end
    return maior
end

print("Digite os números separados por espaço:")
local entrada = io.read()               
local array = {}

for num in entrada:gmatch("%S+") do
    table.insert(array, tonumber(num))
end

print("O maior número da lista é: " .. maiorNumero(array))
