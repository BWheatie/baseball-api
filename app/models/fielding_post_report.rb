module FieldingPostReport
  def self.required_fielding_post_attrs
    [:G, :POS]
  end

  def self.optional_fielding_post_attrs
    [:GS, :InnOuts, :PO, :A, :E, :DP, :PB, :WP, :SB, :CS, :ZB]
  end
  (self.required_fielding_post_attrs + self.optional_fielding_post_attrs).each do |stat|
    define_method(stat) do
      sum_fieldingpost_stat(stat)
    end
  end

  def sum_fieldingpost_stat(fieldingpost)
    bats = @player.fieldingposts.pluck(fieldingpost)
    bats.reduce(:+)
  end

  def FP
    field = @player.fieldingposts.pluck(:PO, :A, :E)
    (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+)) / (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+) +
    field.map{|f| f[2]}.reduce(:+)).to_f
  end
end