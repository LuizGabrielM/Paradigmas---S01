function filtrarPares(array)
    local pares = {}
    for i = 1, #array do
        if array[i] % 2 == 0 then
            table.insert(pares, array[i])
        end
    end
    return pares
end

print("Digite os números separados por espaço:")
local entrada = io.read()
local array = {}

for num in entrada:gmatch("%S+") do
    table.insert(array, tonumber(num))
end

local pares = filtrarPares(array)

print("Números pares encontrados:")
for i = 1, #pares do
    io.write(pares[i] .. " ")
end
print()
