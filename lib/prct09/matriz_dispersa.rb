#require 'prct09/matriz.rb'

class Matriz_dispersa #< Matriz
	attr_accessor :fil, :col, :valor
	
	#INITIALIZE
	def initialize(fil, col, *valor)
		@fil, @col = fil, col
		@m = Array.new
		@pos = Array.new
		contador = 0
		
		for i in 0...fil do
			@m[i] = Array.new
			@pos[i] = Array.new
			for j in 0...col do
				if(valor[contador] != 0)
					@m[i][j] = valor[contador]
					@pos[i][j] = true
# 					contador+=1
				else
					@m[i][j] = 0
					@pos[i][j] = false
# 					contador+=1
				end
				contador+=1
			end
		end
	
	end
	
	
	#[]
	def [](i)
		@m[i]
	end
	

	#TO_S
	def to_s
		cadena = "\tMatriz (#{self.fil}, #{self.col})\n"
		for i in (0...self.fil)
			cadena << "\t | "
			for j in (0...self.col)
				if(@pos[i][j] == true)
					cadena << "#{self[i][j]} "
				else
					cadena << "0 "
				end
			end
            cadena << "|\n"
		end

		return cadena
	end
	
	
end

disp = Matriz_dispersa.new(3,3,1,0,0,0,1,0,0,0,1)
puts disp
