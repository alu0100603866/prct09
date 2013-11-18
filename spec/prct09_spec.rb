 require 'spec_helper'
 require 'prct09'

 describe Prct09 do   
	
	before :each do
	  @m = Matriz
	  @f = Fraccion
	end
	
	describe "Inicializacion de la matriz" do

		it "Creacion correcta de la matriz" do
	        	lambda { @m.new(1, 0)}.should raise_error(IndexError)
		        lambda { @m.new(-1, 1, 1)}.should raise_error(IndexError)
			lambda { @m.new(1, 1, 1, 2)}.should raise_error(IndexError)
		end

	end	
	
	describe "Operaciones con matrices" do

		it "Suma de matrices" do
			(@m.new(2,2,2) + @m.new(2,2,1)).should == @m.new(2,2,3)   
			(@m.new(2,3,1,2,3,4,5,6) + @m.new(2,3,1)).should == @m.new(2,3,2,3,4,5,6,7)
		end
		it "Suma de matrices en forma de fraccion" do
			(@m.new(2,2, @f.new(1,2), @f.new(1,3), @f.new(1,4), @f.new(1,5)) + @m.new(2,2, @f.new(1,2), @f.new(2,3), @f.new(3,4), @f.new(4,5))).should == @m.new(2,2,@f.new(1,1))
		end
	
		it "Resta de matrices" do
			(@m.new(2,2,2,3,4,5) - @m.new(2,2,1)).should == @m.new(2,2,1,2,3,4)
			(@m.new(3,3,-4) - @m.new(3,3,-4)).should == @m.new(3,3,0,0,0,0,0,0,0,0,0)     
		end
	
		it "Multiplicar matrices" do
	 		(@m.new(2,2,1,2,3,4) * @m.new(2,2,1,0,0,1)).should == @m.new(2,2,1,2,3,4)
			(@m.new(2,2,2,3,4,5) * @m.new(2,3,2)).should == @m.new(2,3,10,10,10,18,18,18)
		end
		it "Multiplicar matrices en forma de fraccion" do
			(@m.new(2,2, @f.new(1,2), @f.new(1,3), @f.new(1,4), @f.new(1,5)) * @m.new(2,2, @f.new(1,2), @f.new(2,3), @f.new(3,4), @f.new(4,5))).should == @m.new(2,2,@f.new(1,2), @f.new(3,5), @f.new(11,40), @f.new(49,150))
		end
	end


 end
