module FieldingPostReport
  def self.required_attrs
    [:G]
  end

  def self.optional_attrs
    [:GS, :InnOuts, :PO, :A, :E, :DP, :PB, :WP, :SB, :CS]
  end
  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      sum_fieldingpost_stat(stat)
    end
  end

  def sum_fieldingpost_stat(fieldingpost)
    fields = @player.fieldingposts.pluck(fieldingpost).reject{ |f| f.nil?}
    fields.reduce(0, :+)
  end

  def FPpost
    field = @player.fieldingposts.pluck(:PO, :A, :E)
    (field.map{|f| f[0] ? f[0] : 0}.reduce(0, :+) + field.map{|f| f[1] ? f[1] : 0}.reduce(0, :+)) / (field.map{|f| f[0] ? f[0] : 0}.reduce(0, :+) +
    field.map{|f| f[1] ? f[1] : 0}.reduce(0, :+) + field.map{|f| f[2] ? f[2] : 0}.reduce(0, :+)).to_f
  end
end