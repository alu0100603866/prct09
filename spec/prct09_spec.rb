 require 'spec_helper'
 require 'prct09'

 describe Prct09 do   
	
	before :each do
	  @m1 = Matriz
	  @m = Matriz_densa
	  @md = Matriz_dispersa
	  @f = Fraccion
	end
	
	describe "Inicializacion de la matriz" do

		it "Creacion correcta de la matriz densa" do
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
		
		it "Suma de matrices densa + dispersa, dispersa + densa" do
			(@m.new(2,2,2) + @md.new(2,2,0,0,0,1)).should == @m1.new(2,2,2,2,2,3)   
			(@md.new(2,3,0,0,0,4,0,0) + @m.new(2,3,1)).should == @m.new(2,3,1,1,1,5,1,1)
		end
		
		it "Suma de matrices dispersa + dispersa" do
			(@md.new(2,2,0,0,1,1) + @md.new(2,2,0,0,0,1)).should == @m1.new(2,2,0,0,1,2)   
		end
	
		it "Resta de matrices" do
			(@m.new(2,2,2,3,4,5) - @m.new(2,2,1)).should == @m.new(2,2,1,2,3,4)
			(@m.new(3,3,-4) - @m.new(3,3,-4)).should == @m.new(3,3,0,0,0,0,0,0,0,0,0)     
		end
		
		it "Resta de matrices densa - dispersa, dispersa - densa" do
			(@m.new(2,2,2) - @md.new(2,2,0,0,0,1)).should == @m1.new(2,2,2,2,2,1)   
			(@md.new(2,3,0,0,0,4,0,0) - @m.new(2,3,1)).should == @m.new(2,3,-1,-1,-1,3,-1,-1)
		end
		
		it "Resta de matrices dispersa - dispersa" do
			(@md.new(2,2,0,0,1,1) - @md.new(2,2,0,0,0,1)).should == @m1.new(2,2,0,0,1,0)   
		end
	
		it "Multiplicar matrices" do
	 		(@m.new(2,2,1,2,3,4) * @m.new(2,2,1,0,0,1)).should == @m.new(2,2,1,2,3,4)
			(@m.new(2,2,2,3,4,5) * @m.new(2,3,2)).should == @m.new(2,3,10,10,10,18,18,18)
		end
		it "Multiplicar matrices en forma de fraccion" do
			(@m.new(2,2, @f.new(1,2), @f.new(1,3), @f.new(1,4), @f.new(1,5)) * @m.new(2,2, @f.new(1,2), @f.new(2,3), @f.new(3,4), @f.new(4,5))).should == @m.new(2,2,@f.new(1,2), @f.new(3,5), @f.new(11,40), @f.new(49,150))
		end
		
		it "Multiplicar matrices dispersa * densa, densa * dispersa" do
	 		(@md.new(2,2,0,0,1,1) * @m.new(2,2,2,0,3,5)).should == @m.new(2,2,0,0,5,5)
			(@m.new(2,2,2,3,4,5) * @md.new(2,3,2,2,2,2,2,2)).should == @m.new(2,3,10,10,10,18,18,18)
		end
		
		it "Multiplicar matrices dispersa * dispersa" do
	 		(@md.new(2,2,0,0,1,1) * @md.new(2,2,2,0,3,5)).should == @m.new(2,2,0,0,5,5)
		end
	end
	
	describe "Operaciones con matriz hibridas" do
	
		it "Suma de matrices entera-racional, racional-entera" do
			(@m.new(2,2, @f.new(1,2), @f.new(1,3), @f.new(1,4), @f.new(1,5)) + @m.new(2,2,1,1,1,1)).should == @m.new(2,2, @f.new(3,2), @f.new(4,3), @f.new(5,4), @f.new(6,5))
			(@m.new(2,2,1,1,1,1) + @m.new(2,2, @f.new(1,2), @f.new(1,3), @f.new(1,4), @f.new(1,5))).should == @m.new(2,2, @f.new(3,2), @f.new(4,3), @f.new(5,4), @f.new(6,5))
		end

	
		it "Multiplicar matrices entera-racional, racional-entera" do
			(@m.new(2,2, @f.new(1,2), @f.new(1,3), @f.new(1,4), @f.new(1,5)) * @m.new(2,2, 1, 1, 1, 1)).should == @m.new(2,2, @f.new(5,6), @f.new(5,6), @f.new(9,20), @f.new(9,20))
			(@m.new(2,2, 1, 1, 1, 1) * @m.new(2,2, @f.new(1,2), @f.new(1,3), @f.new(1,4), @f.new(1,5))).should == @m.new(2,2, @f.new(3,4), @f.new(8,15), @f.new(3,4), @f.new(8,15))
		end
		
	end
		

	describe "Mayor y menor" do

		it "Menor de matriz dispersa" do
			(@md.new(3,3,3,5,6,7,8,9,1,3,2).menor).should == 1
		end

		it "Mayor de matriz dispersa" do
			(@md.new(3,3,1,2,3,4,5,4,3,2,1).mayor).should == 5
		end
	end	
	
	describe "Modificacion" do
	  it "Encontrar" do
	    (@m.new(3,3,1,2,3,4,5,6,7,8,9).encontrar{|e| e*e >= 16}).should eq ([1,0])
	  end
	end


 end
