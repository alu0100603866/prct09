require 'prct09/frac_main.rb'

class Matriz

        attr_reader :fil, :col

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

        def [] (i) # Para facilitar el acceso, asC- no tendrC) que poner siempre self.datos[i][j] sino self[i][j]
                @datos[i]
        end



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




      


end

#m = Matriz.new(2,2)
#puts m.to_s

