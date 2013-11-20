require 'prct09/matriz.rb'
require 'prct09/matriz_dispersa.rb'


require './matriz.rb'


class Matriz_densa < Matriz

	attr_accessor :fil, :col, :m
	

        def initialize (*args) # nC:meros de argumentos variables *
                raise IndexError unless ((args[0] > 0) && (args[1] > 0)) # Error, si dimensiC3n <0
                @fil = args[0]
                @col = args[1]
                @datos = Array.new(@fil) {Array.new(@col) {0}} if (args.size == 2) # Datos inicializados a 0
                @datos = Array.new(@fil) {Array.new(@col) {args[2]}} if (args.size == 3) # Datos inicializados al 3 argumento
                if (args.size > 3)
                        tam = @fil * @col # NC:mero de elementos, tam
                        raise IndexError unless (args.size == tam + 2) # Si hay tantos elementos para llenar la matriz
                        @datos = Array.new(@fil) {Array.new(@col) {0}}
                        for i in (0...self.fil)
                                for j in (0...self.col)
                                        self[i][j] = args[i*@col+j+2]
                                end
                        end
                end # if
        end

        def to_s
                cadena = "\tMatriz (#{self.fil}, #{self.col})\n"
                for i in (0...self.fil)
                                cadena << "\t | "
                        for j in (0...self.col)
                                cadena << "#{self[i][j]} "
                        end
                                cadena << "|\n"
                end

                return cadena
        end

#         def [] (i) # Para facilitar el acceso, asC- no tendrC) que poner siempre self.datos[i][j] sino self[i][j]
#                 @datos[i]
#         end



        def == (m) #Comparacion de matrices para despues compararlas en el spec
                raise IndexError unless ((self.fil == m.fil) && (self.col == m.col)) #Las dimensiones tienen que ser iguales

                igual = true
                for i in (0...self.fil)
                        for j in (0...self.col)
                                igual = false if (self[i][j] != m[i][j])
                        end
                end         

                return igual
        end




        def +(m)
                raise IndexError unless ((self.fil == m.fil) && (self.col == m.col)) #Las dimensiones tienes que ser iguales

                suma = Matriz.new(self.fil, self.col)

                for i in (0...self.fil)
                        for j in (0...self.col)
                                suma[i][j] = self[i][j] + m[i][j]
                        end
                end  

                return suma                
        end


        def -(m)
                raise IndexError unless ((self.fil == m.fil) && (self.col == m.col)) #Las dimensiones tienen que ser iguales

                resta = Matriz.new(self.fil, self.col)

                for i in (0...self.fil)
                        for j in (0...self.col)
                                resta[i][j] = self[i][j] - m[i][j]
                        end
                end  

                return resta
        end


        def *(m)
                raise IndexError unless (self.col == m.fil) #num de col de la primera tiene que ser igual a num de fil de lasegunda.

                mult = Matriz.new(self.fil, m.col)

                for i in (0...self.fil) 
                        for j in (0...m.col)
                                sum = self[i][0] * m[0][j]
                                for k in (1...self.col)
                                        sum += self[i][k] * m[k][j]
                                end
                                mult[i][j] = sum
                        end
                end  

                return mult        
        end
		
		
		
		#ELEMENTO MAYOR
		def mayor
			  for i in (0...self.fil) 
                        for j in (0...m.col)
							if (may == 0)
								may = self[i][j] 
							elsif may < self[i][j]
								may = self[i][j] 
							end
                        end
                end
				return may
		end
		
		
		
		#ELEMENTO MENOR
		def menor
			  for i in (0...self.fil) 
                        for j in (0...m.col)
							if (men == 0)
								men = self[i][j] 
							elsif men > self[i][j]
								men = self[i][j] 
							end
                        end
                end
				return men
		end
		
	
	
end


