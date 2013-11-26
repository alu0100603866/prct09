require 'prct09/matriz.rb'



class Matriz_dispersa < Matriz
	
	attr_accessor :fil, :col, :m, :pos_fil, :pos_col

	
	#INITIALIZE
	
	def initialize (*args) # nC:meros de argumentos variables *
		raise IndexError unless ((args[0] > 0) && (args[1] > 0)) # Error, si dimensiC3n <0
		fil = args[0]
		col = args[1]
		@dat = Array.new
		@pos_fil = Array.new
		@pos_col = Array.new
		contador = 2
		contador2 = 0
	
		
		for i in (0...fil) 
			for j in (0...col) 
				z = args[contador]

				if(z != 0)
					@dat[contador2] = z
					@pos_fil[contador2] = i
					@pos_col[contador2] = j
										
					contador2+=1
				end
				contador+=1
			end
		end
		
		super(fil,col)
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
					cadena << "#{@dat[contador_m]} "
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
	
		if(other.instance_of? Matriz_dispersa)
			suma = Matriz.new(fil,col)
			suma = self + suma
			suma = other + suma
			return suma
                        
		else
			raise IndexError unless ((self.fil == other.fil) && (self.col == other.col))
#			if((self.fil == other.fil) && (self.col == other.col))
			contador = 0
			suma = Matriz.new(self.fil, self.col)
		

			self.fil.times do |i|
				self.col.times do |j|
					if (@pos_fil[contador] == i && @pos_col[contador] == j)
						suma[i][j] = @dat[contador] + other[i][j] 
						contador += 1
					else
						suma[i][j] = other[i][j]
					end
				end
			end
		end
# 		end
		return suma
	end
	
	
	
	#RESTA
	def -(other)
		if(other.instance_of? Matriz_dispersa)
			resta = Matriz_densa.new(fil,col)
			x = Matriz_densa.new(fil,col)
			resta = self - resta
			resta = other - resta
			return x - resta
                        
		else
			raise IndexError unless ((self.fil == other.fil) && (self.col == other.col))
#			if((self.fil == other.fil) && (self.col == other.col))
			contador = 0
			resta = Matriz.new(self.fil, self.col)
		

			self.fil.times do |i|
				self.col.times do |j|
					if (@pos_fil[contador] == i && @pos_col[contador] == j)
						resta[i][j] = @dat[contador] - other[i][j] 
						contador += 1
					else
						resta[i][j] = -other[i][j]
					end
				end
			end
		end
# 		end
		return resta
	end

	
	
	#MULTIPLICACION
	def *(other)
		raise IndexError unless (self.col == other.fil) #num de col de la primera tiene que ser igual a num de fil de lasegunda.
		
		
		if (other.instance_of? Matriz_dispersa)
			otro = Matriz.new(other.fil, other.col)
			otro = other + otro
			return self * otro
		end
		
		yo = Matriz.new(fil, col)
		yo = self + yo
		mult = Matriz.new(self.fil, other.col)
		for i in (0...self.fil) 
			for j in (0...other.col)
				sum = yo[i][0] * other[0][j]
				for k in (1...self.col)
					sum += yo[i][k] * other[k][j]
				end
				mult[i][j] = sum
			end
		end  

		return mult   
	end
	
	
	
	#MAYOR
	def mayor
		contador = 0
		for i in 0...@dat.size do
			if (may == 0)
				may = @dat[contador]
			elsif (may < @dat[contador])
				may = @dat[contador]
			end
			contador += 1
		end
	
		return may
	end
	
	
	
	#MENOR
	def menor
		contador = 0
		for i in 0...@dat.size do
			if (men == 0)
				men = @dat[contador]
			elsif (men > @dat[contador])
				men = @dat[contador]
			end
			contador += 1
		end
	
		return men
	end
	
	
	
	
end

