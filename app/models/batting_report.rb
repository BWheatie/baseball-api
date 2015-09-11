module BattingReport
  def self.required_attrs
    [:G, :AB]
  end

  def self.optional_attrs
    [:R, :H, :"2B", :"3B", :HR, :RBI, :SB, :CS, :BB, :SO, :IBB, :HBP, :SH, :SF, :GIDP]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      StatHelper.sum_batting_stat(@player, stat)
    end
  end

  def AVG
    bats = @player.battings.pluck(:H, :AB)
    bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+) / bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+).to_f
  end

  def SLG
    bats = @player.battings.pluck(:"2B", :"3B", :HR, :AB)
    (single + (bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+)*2) + (bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+)*3) +
    (bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+)*4)) / (bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+)).to_f
  end

  def OBP
    bats = @player.battings.pluck(:H, :BB, :HBP, :AB, :SF)
    (bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+)) + bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) + bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+)  /
    (bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+) + bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) + bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+) +
    bats.map{|b| b[4] ? b[4] : 0}.reduce(0, :+)).to_f
  end

  def OPS
    self.SLG + self.OBP
  end

  def ISO
    self.SLG - self.AVG
  end

  def BABIP
    bats = @player.battings.pluck(:H, :HR, :SO, :AB, :SF)
    (bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+) - bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+)) / (bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+) -
    bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+) - bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) - bats.map{|b| b[4] ? b[4] : 0}.reduce(0, :+)).to_f
  end

  def PA
    bats = @player.battings.pluck(:SH, :BB, :HBP, :AB, :SF)
    bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+) + bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) + bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+) +
    bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+) + bats.map{|b| b[4] ? b[4] : 0}.reduce(0, :+).to_f
  end

  def TB
    bats = @player.battings.pluck(:"2B", :"3B", :HR, :AB)
    (single + (bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+)*2) + (bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+)*3) +
    (bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+)*4)).to_f
  end

  private
  def single
    bats = @player.battings.pluck(:H, :"2B", :"3B", :HR)
    bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+) - (bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) + bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+) +
    bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+).to_f)
  end
end