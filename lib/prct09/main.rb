require './matriz.rb'
require './matriz_densa.rb'
require './matriz_dispersa.rb'


m1 = Matriz_densa.new(3,3,1,2,3,4,5,6,7,8,9)
m2 = Matriz_densa.new(2,2,1,0,0,1)

puts m1
puts m2


m3 = Matriz_dispersa.new(3,3,1,0,0,0,1,0,0,0,1)
puts m3


m4 = Matriz_dispersa.new(3,3,1,2,3,4,5,6,7,8,9)
puts m4

