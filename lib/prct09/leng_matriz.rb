require 'prct09/matriz_densa'

class Matriz_DSL
  def initialize(instruccion, &block)
    @instruccion = instruccion
    @option = Array.new
    @tipo = "densa"
    @matrices = Array.new
    
    instance_eval(&block)

   
    
  end
  
  def operandos(matriz)
    n = 0
    m = 0
    posiciones = Array.new
    x = 2
    y = 0
    posiciones[0] = 0
    
    matriz.each_char do |i|
      if (i == /[0-9]/)
	posiciones[x] = i
	x += 1
	n += 1
      end
      if (i == "]")
	if (posiciones[0] != 0)
	  posiciones[0] = n
	end
	m += 1
      end
    end
    
    posiciones[1] = m-1
    
    if (@tipo == "densa")
     @matrices[y] = Matriz_densa.new(posiciones)
    end
  end
  
  def to_s
#     resultado = Matriz.new(@n, @m)
    if(@instruccion == "suma")
     for i in (0...@matrices.size) do 
	puts @matrices[i]
      end
    end
  end
  
  
end


nueva_matriz = Matriz_DSL.new("suma") do
  operandos ("[[1,2],[3,4]]")
end

puts nueva_matriz
