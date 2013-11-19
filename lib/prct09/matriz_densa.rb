require 'prct09/matriz.rb'
require 'prct09/matriz_dispersa.rb'


class Matriz_densa < Matriz

  def initialize (*args)
	super
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


       
end


