module FieldingReport
  def self.required_attrs
    [:G, :POS]
  end

  def self.optional_attrs
    [:GS, :InnOuts, :PO, :A, :E, :DP, :PB, :WP, :SB, :CS, :ZR]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      sum_fielding_stat(stat)
    end
  end

  def sum_fielding_stat(fielding)
    fields = @player.fieldings.pluck(fielding).reject{|f| f.nil?}
    fields.reduce(0, :+)
  end

  def FP
    field = @player.fieldings.pluck(:PO, :A, :E)
    (field.map{|f| f[0] ? f[0] : 0}.reduce(0, :+) + field.map{|f| f[1] ? f[1] : 0}.reduce(0, :+)) / (field.map{|f| f[0] ? f[0] : 0}.reduce(0, :+) +
    field.map{|f| f[1] ? f[1] : 0}.reduce(0, :+) + field.map{|f| f[2] ? f[2] : 0}.reduce(0, :+)).to_f
  end
end