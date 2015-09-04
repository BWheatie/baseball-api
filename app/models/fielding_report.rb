def FP
  field = @player.fieldings.pluck(:PO, :A, :E)
  (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+)) / (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+) +
  field.map{|f| f[2]}.reduce(:+)).to_f
end