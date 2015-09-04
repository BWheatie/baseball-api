class BattingReport < Report
  [:G, :AB, :R, :H, :"2B", :"3B", :HR, :RBI, :SB, :CS, :BB, :SO, :IBB, :HBP, :SH, :SF, :GIDP].each do |stat|
    define_method(stat) do
      sum_pitching_stat(stat)
    end
  end

  def sum_batting_stat(batting)
    bats = @player.battings.pluck(batting)
    bats.reduce(:+)
  end

  def AVG
    bats = @player.battings.pluck(:H, :AB)
    bats.map{|b| b[0]}.reduce(:+) / bats.map{|b| b[1]}.reduce(:+).to_f
  end

  def SLG
    bats = @player.battings.pluck(:"2B", :"3B", :HR, :AB)
    (single + (bats.map{|b| b[0]}.reduce(:+)*2) + (bats.map{|b| b[1]}.reduce(:+)*3) + (bats.map{|b| b[2]}.reduce(:+)*4)) /
    (bats.map{|b| b[3]}.reduce(:+)).to_f
  end

  def OBP
    bats = @player.battings.pluck(:H, :BB, :HBP, :AB, :SF)
    (bats.map{|b| b[0]}.reduce(:+) + bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+)) /
    (bats.map{|b| b[3]}.reduce(:+) + bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+) + bats.map{|b| b[4]}.reduce(:+)).to_f
  end

  def OPS
    self.SLG + self.OBP
  end

  def ISO
    self.SLG - self.AVG
  end

  def BABIP
    bats = @player.battings.pluck(:H, :HR, :SO, :AB, :SF)
    (bats.map{|b| b[0]}.reduce(:+) - bats.map{|b| b[1]}.reduce(:+)) / (bats.map{|b| b[3]}.reduce(:+) - bats.map{|b| b[2]}.reduce(:+) -
    bats.map{|b| b[1]}.reduce(:+) - bats.map{|b| b[4]}.reduce(:+)).to_f
  end

  def PA
    bats = @player.battings.pluck(:SH, :BB, :HBP, :AB, :SF)
    bats.map{|b| b[0]}.reduce(:+) + bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+) + bats.map{|b| b[3]}.reduce(:+) +
    bats.map{|b| b[4]}.reduce(:+).to_f
  end

  def TB
    bats = @player.battings.pluck(:"2B", :"3B", :HR, :AB)
    (single + (bats.map{|b| b[0]}.reduce(:+)*2) + (bats.map{|b| b[1]}.reduce(:+)*3) + (bats.map{|b| b[2]}.reduce(:+)*4)).to_f
  end

  private
  def single
    bats = @player.battings.pluck(:H, :"2B", :"3B", :HR)
    bats.map{|b| b[0]}.reduce(:+) - (bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+) + bats.map{|b| b[3]}.reduce(:+).to_f)
  end
end