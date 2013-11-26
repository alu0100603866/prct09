#! /usr/bin/ruby
# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion
#al tener los archivos separados en lib programa y test pruebas hay que indicarlo al requerir los archivos
require "./lib/prct09.rb"


require "test/unit"

class Test_Fraccion < Test::Unit::TestCase

	def test_suma
		@m = Matriz_densa
		assert_equal(@m.new(2,2,3),(@m.new(2,2,2) + @m.new(2,2,1)))
	end

end