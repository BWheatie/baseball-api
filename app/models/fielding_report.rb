module FieldingReport
  def self.required_attrs
    [:G, :POS]
  end

  def self.optional_attrs
    [:GS, :InnOuts, :PO, :A, :E, :DP, :PB, :WP, :SB, :CS, :ZB]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      sum_fielding_stat(stat)
    end
  end

  def sum_fielding_stat(fielding)
    fields = @player.fieldings.pluck(fielding)
    fields.reduce(:+)
  end

  def FP
    field = @player.fieldings.pluck(:PO, :A, :E)
    (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+)) / (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+) +
    field.map{|f| f[2]}.reduce(:+)).to_f
  end
end