module FieldingPostReport
  def self.required_attrs
    [:G]
  end

  def self.optional_attrs
    [:GS, :InnOuts, :PO, :A, :E, :DP, :PB, :WP, :SB, :CS, :ZB]
  end
  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      sum_fieldingpost_stat(stat)
    end
  end

  def sum_fieldingpost_stat(fieldingpost)
    fields = @player.fieldingposts.pluck(fieldingpost)
    fields.reduce(:+)
  end

  def FPpost
    field = @player.fieldingposts.pluck(:PO, :A, :E)
    (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+)) / (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+) +
    field.map{|f| f[2]}.reduce(:+)).to_f
  end
end