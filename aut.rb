arq = IO.readlines("arquivo.txt")
matriz = arq[2].split(",")
est_ini = arq[3].chomp
est_finais = arq[4].chomp.split(",")

hold = 0

puts "\n\n"
while hold == 0

atual = est_ini

puts "digite fita:"
fita = gets.chomp.split("") 

#Função para controlar as transições de estados do autômato
def trans(at,char,mat)
   news = at + char
   mat.select{ |item| item.include? news }
end

#leitura da palavra 
fita.each do |key|
    inter = trans(atual,key,matriz)
    if inter.length < 1
     atual = nil
     break;
    else 
	   atual = inter[0][2]
	end
end

if est_finais.include? atual
	puts "\n\n"
	puts "palavra reconhecida ><"
	puts "\n"
else
	puts "\n\n"
	puts "nao reconhecida ><"
	puts "\n"
end
    puts "\n"
    puts "sair? digite algo diferente de zero, continuar? outra tecla"
    hold = gets.chomp.to_i
end