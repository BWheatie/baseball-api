module BattingPostReport
  def self.required_batting_post_attrs
    [:G, :AB]
  end

  def self.optional_batting_post_attrs
    [:R, :H, :"2B", :"3B", :HR, :RBI, :SB, :CS, :BB, :SO, :IBB, :HBP, :SH, :SF, :GIDP]
  end

  (self.required_batting_post_attrs + self.optional_batting_post_attrs).each do |stat|
    define_method(stat) do
      sum_battingpost_stat(stat)
    end
  end


  def sum_battingpost_stat(battingpost)
    bats = @player.battingposts.pluck(battingpost)
    bats.reduce(:+)
  end

  def AVG
    bats = @player.battingposts.pluck(:H, :AB)
    bats.map{|b| b[0]}.reduce(:+) / bats.map{|b| b[1]}.reduce(:+).to_f
  end

  def SLG
    bats = @player.battingposts.pluck(:"2B", :"3B", :HR, :AB)
    (single + (bats.map{|b| b[0]}.reduce(:+)*2) + (bats.map{|b| b[1]}.reduce(:+)*3) + (bats.map{|b| b[2]}.reduce(:+)*4)) /
    (bats.map{|b| b[3]}.reduce(:+)).to_f
  end

  def OBP
    bats = @player.battingposts.pluck(:H, :BB, :HBP, :AB, :SF)
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
    bats = @player.battingposts.pluck(:H, :HR, :SO, :AB, :SF)
    (bats.map{|b| b[0]}.reduce(:+) - bats.map{|b| b[1]}.reduce(:+)) / (bats.map{|b| b[3]}.reduce(:+) - bats.map{|b| b[2]}.reduce(:+) -
    bats.map{|b| b[1]}.reduce(:+) - bats.map{|b| b[4]}.reduce(:+)).to_f
  end

  def PA
    bats = @player.battingposts.pluck(:SH, :BB, :HBP, :AB, :SF)
    bats.map{|b| b[0]}.reduce(:+) + bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+) + bats.map{|b| b[3]}.reduce(:+) +
    bats.map{|b| b[4]}.reduce(:+).to_f
  end

  def TB
    bats = @player.battingposts.pluck(:"2B", :"3B", :HR, :AB)
    (single + (bats.map{|b| b[0]}.reduce(:+)*2) + (bats.map{|b| b[1]}.reduce(:+)*3) + (bats.map{|b| b[2]}.reduce(:+)*4)).to_f
  end

  private
  def single
    bats = @player.battingposts.pluck(:H, :"2B", :"3B", :HR)
    bats.map{|b| b[0]}.reduce(:+) - (bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+) + bats.map{|b| b[3]}.reduce(:+).to_f)
  end
end