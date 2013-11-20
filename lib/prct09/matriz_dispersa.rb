require 'prct09/matriz.rb'



class Matriz_dispersa < Matriz
	
	attr_accessor :fil, :col, :m, :pos_fil, :pos_col

	
	#INITIALIZE
	def initialize(fil, col, *valor)
		@fil, @col = fil, col
		@datos = Array.new
		@pos_fil = Array.new
		@pos_col = Array.new
		contador = 0
		contador2 = 0
		
		
		for i in 0...fil do
			for j in 0...col do
				if(valor[contador] != 0)
					@datos[contador2] = valor[contador]
					contador2+=1
					@pos_fil[contador2] = i
					@pos_col[contador2] = j
					
# 					puts "posicion #{@pos_fil[contador2]}, #{@pos_col[contador2]}" #chivato
					
# 				else
				end
				contador+=1
			end
		end
		
# 		#Chivato
# 		for i in 0...pos_fil.size do
# 			puts "posicion initialize #{@pos_fil[i]},#{@pos_col[i]}"
# 		end
		
	end
	
	
	
	#TO_S
	def to_s
		contador = 1
		contador_m = 0
		
		cadena = "\tMatriz (#{fil}, #{col})\n"
		for i in 0...fil do
			cadena << "\t | "
			for j in 0...col do
				
# 				puts "contador #{contador}" #chivato
# 				puts "for #{i},#{j}"
# 				puts "posicion #{@pos_fil[contador]}, #{@pos_col[contador]}" #chivato
				
				if((@pos_fil[contador] == i) && (@pos_col[contador] == j))
					cadena << "#{@datos[contador_m]} "
					contador+=1
					contador_m+=1
				else
					cadena << "0 "
				end
				
				
				
			end
			cadena << "|\n"
		end
	
		return cadena
	end
	
	
	
	#COERCE
	def coerce(other)
		[self,other]
	end
	
	
	
	#SUMA
	def +(other)
		raise IndexError unless ((self.fil == other.fil) && (self.col == other.col))
# 		if((self.fil == other.fil) && (self.col == other.col))
		
		suma = Matriz_dispersa.new(self.fil, self.col)
		
			for i in 0...fil do
				for j in 0...col do
					suma[i][j] = self[i][j] + other[i][j]
				end
			end
			
# 		end
		return suma
	end
	
	
	
	#RESTA
	def -(other)
		raise IndexError unless ((self.fil == m.fil) && (self.col == m.col))
# 		if((self.fil == other.fil) && (self.col == other.col))
		
		resta = Matriz_dispersa.new(self.fil, self.col)
		
			for i in 0...fil do
				for j in 0...col do
					resta[i][j] = self[i][j] - other[i][j]
				end
			end
			
# 		end
		return resta
	end
	
	
	#MULTIPLICACION
	def *(other)
		raise IndexError unless (self.col == other.fil) #num de col de la primera tiene que ser igual a num de fil de lasegunda.

		mult = Matriz_dispersa.new(self.fil, other.col)
		for i in (0...self.fil) 
			for j in (0...other.col)
				sum = self[i][0] * other[0][j]
				for k in (1...self.col)
					sum += self[i][k] * other[k][j]
				end
				mult[i][j] = sum
			end
		end  

		return mult   
	end
	
	
	
	#MAYOR
	def mayor
		contador = 0
		for i in 0...@datos.size do
			if (may == 0)
				may = @datos[contador]
			elsif (may < @datos[contador])
				may = @datos[contador]
			end
			contador += 1
		end
	
		return may
	end
	
	
	
	#MENOR
	def menor
		contador = 0
		for i in 0...@datos.size do
			if (men == 0)
				men = @datos[contador]
			elsif (men > @datos[contador])
				men = @datos[contador]
			end
			contador += 1
		end
	
		return men
	end
	
	
	
	
end

