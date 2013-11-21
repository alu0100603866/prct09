class Fraccion
	attr_reader :num, :dem

	def initialize(num,dem)
		comun = mcd(num, dem)
		@num = num/comun
		@dem = dem/comun
	end
	
	def mcd(a, b)
		while b != 0
			a, b = b, a % b
		end
		a
	end

	def to_s
		"#{num}/#{dem}"
	end

	def to_f
		@num/@dem
	end

	def == (fr)
		((self.num == fr.num) && (self.dem == fr.dem))
	end

	def abs
		Fraccion.new(@num.abs,@dem.abs)
	end

	def reciproco
		Fraccion.new(@dem, @num)
	end
	
	#Opuesto
	def -@
		Fraccion.new(-@num, @dem)
	end
	
	#Suma
	def +(other)
		if (other.instance_of? Fixnum)
			return Fraccion.new(@num+(@dem * other),@dem)
		end
	
		if(@dem == other.dem)
		  Fraccion.new(@num + other.num, @dem)
		else
		  Fraccion.new(@num * other.dem + @dem * other.num, @dem * other.dem)
		end
	end
	
	#Resta
	def -(other)
		if (other.instance_of? Fixnum)
			return Fraccion.new(@num+(@dem * other),@dem)
		end
		if(@dem == other.dem)
		  Fraccion.new(@num - other.num, @dem)
		else
		  Fraccion.new(@num * other.dem - @dem * other.num, @dem * other.dem)
		end
	end
	
	#Multiplicación
	def *(other)
		if (other.instance_of? Fixnum)
			return Fraccion.new(@num * other,@dem)
		end
		Fraccion.new(@num * other.num, @dem * other.dem)
	end
	
	#División
	def /(other)		#/
		Fraccion.new(@num * other.dem, @dem * other.num)
	end
	
	#Resto
	def %(other)
		num1 = ((@num * other.dem) % (@dem * other.num))
		Fraccion.new(num1,1)
	end
	
	#Menor que
	def <(other)
		(@num * other.dem) < (@dem * other.num)
	end
	
	#Mayor que
	def >(other)
		(@num * other.dem) > (@dem * other.num)
	end
	
	#Menor o igual que
	def <=(other)
		(@num * other.dem) <= (@dem * other.num)
	end
	
	#Mayor o igual que
	def >=(other)
		(@num * other.dem) >= (@dem * other.num)
	end
	
	def coerce(other)
     return self, other
   end

end
