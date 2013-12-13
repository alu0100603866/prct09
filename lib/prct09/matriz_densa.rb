require 'prct09/matriz.rb'
require 'prct09/matriz_dispersa.rb'
# require 'prct09/leng_matriz.rb'
class Matriz_densa < Matriz

	attr_accessor :fil, :col, :m
	

        def initialize (*args) # nC:meros de argumentos variables *
               super
		end



#         def [] (i) # Para facilitar el acceso, asC- no tendrC) que poner siempre self.datos[i][j] sino self[i][j]
#                 @datos[i]
#         end

        def +(m)
				if(m.instance_of? Matriz_dispersa)
					return m + self 
                        
                else
					raise IndexError unless ((self.fil == m.fil) && (self.col == m.col)) #Las dimensiones tienes que ser iguales
	
				
					suma = Matriz.new(self.fil, self.col)

					for i in (0...self.fil)
                        for j in (0...self.col)
							suma[i][j] = self[i][j] + m[i][j]
                        end
					end  

                return suma                
				end
        end


        def -(m)
			if(m.instance_of? Matriz_dispersa)
				resta = Matriz_densa.new(fil,col)
				return resta - (m - self) 
				
					
			else
				raise IndexError unless ((self.fil == m.fil) && (self.col == m.col)) #Las dimensiones tienen que ser iguales
				resta = Matriz.new(self.fil, self.col)

				for i in (0...self.fil)
					for j in (0...self.col)
						resta[i][j] = self[i][j] - m[i][j]
					end
				end  
			end
			return resta
				
        end


        def *(m)
                raise IndexError unless (self.col == m.fil) #num de col de la primera tiene que ser igual a num de fil de lasegunda.
				
				if(m.instance_of? Matriz_dispersa)
					otro = Matriz.new(m.fil, m.col)
					otro = m + otro
					return self * otro
				
					
				else
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
		

		
		#Modificación
		def encontrar
		  i = 0
		    self.fil.times do |i|
		      j = 0
		      self.col.times do |j|
			if(yield(@datos[i][j]))
			   return i,j
			end
			j+=1
		      end
		    i+=1
		  end
		return nil
		end
		
		
end
