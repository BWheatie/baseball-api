class Report
  extend ActiveModel::Naming
  include ActiveModel::Serialization
  def initialize player
    @player = player
  end

  def id
    SecureRandom.uuid
  end

  def batting_score
    Comparison.new(self).batting_score - 1000
  end

  def G
    bats = @player.battings.pluck(:G)
    bats.reduce(:+)
  end

  def AB
    bats = @player.battings.pluck(:AB)
    bats.reduce(:+)
  end

  def R
    bats = @player.battings.pluck(:R)
    bats.reduce(:+)
  end

  def H
    bats = @player.battings.pluck(:H)
    bats.reduce(:+)
  end

  def Double
    bats = @player.battings.pluck(:"2B")
    bats.reduce(:+)
  end

  def Triple
    bats = @player.battings.pluck(:"3B")
    bats.reduce(:+)
  end

  def HR
    bats = @player.battings.pluck(:"HR")
    bats.reduce(:+)
  end

  def RBI
    bats = @player.battings.pluck(:"RBI")
    bats.reduce(:+)
  end

  def SB
    bats = @player.battings.pluck(:SB)
    bats.reduce(:+)
  end

  def CS
    bats = @player.battings.pluck(:CS)
    bats.reduce(:+)
  end

  def BB
    bats = @player.battings.pluck(:BB)
    bats.reduce(:+)
  end

  def SO
    bats = @player.battings.pluck(:SO)
    bats.reduce(:+)
  end

  def IBB
    bats = @player.battings.pluck(:IBB)
    bats.reduce(:+)
  end

  def HBP
    bats = @player.battings.pluck(:HBP)
    bats.reduce(:+)
  end

  def SH
    bats = @player.battings.pluck(:SH)
    bats.reduce(:+)
  end

  def SF
    bats = @player.battings.pluck(:SF)
    bats.reduce(:+)
  end

  def GIDP
    bats = @player.battings.pluck(:GIDP)
    bats.reduce(:+)
  end

  def BA
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
    self.SLG - self.BA
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

  def FP
    field = @player.fieldings.pluck(:PO, :A, :E)
    (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+)) / (field.map{|f| f[0]}.reduce(:+) + field.map{|f| f[1]}.reduce(:+) +
    field.map{|f| f[2]}.reduce(:+)).to_f
  end

  def W
    pitch = @player.pitchings.pluck(:W)
    pitch.reduce(:+)
  end

  def L
    pitch = @player.pitchings.pluck(:L)
    pitch.reduce(:+)
  end

  def G
    pitch = @player.pitchings.pluck(:G)
    pitch.reduce(:+)
  end

  def GS
    pitch = @player.pitchings.pluck(:GS)
    pitch.reduce(:+)
  end

  def CG
    pitch = @player.pitchings.pluck(:CG)
    pitch.reduce(:+)
  end

  def SHO
    pitch = @player.pitchings.pluck(:SHO)
    pitch.reduce(:+)
  end

  def SV
    pitch = @player.pitchings.pluck(:SV)
    pitch.reduce(:+)
  end

  def IPouts
    pitch = @player.pitchings.pluck(:IPouts)
    pitch.reduce(:+)
  end

  def H
    pitch = @player.pitchings.pluck(:H)
    pitch.reduce(:+)
  end

  def ER
    pitch = @player.pitchings.pluck(:ER)
    pitch.reduce(:+)
  end

  def HR
    pitch = @player.pitchings.pluck(:HR)
    pitch.reduce(:+)
  end

  def BB
    pitch = @player.pitchings.pluck(:BB)
    pitch.reduce(:+)
  end

  def SO
    pitch = @player.pitchings.pluck(:SO)
    pitch.reduce(:+)
  end

  def BAOpp
    pitch = @player.pitchings.pluck(:BAOpp)
    pitch.reduce(:+)
  end

  def ERA
    pitch = @player.pitchings.pluck(:ERA)
    pitch.reduce(:+)
  end

  def IBB
    pitch = @player.pitchings.pluck(:IBB)
    pitch.reduce(:+)
  end

  def WP
    pitch = @player.pitchings.pluck(:WP)
    pitch.reduce(:+)
  end

  def HBP
    pitch = @player.pitchings.pluck(:HBP)
    pitch.reduce(:+)
  end

  def BK
    pitch = @player.pitchings.pluck(:BK)
    pitch.reduce(:+)
  end

  def BFP
    pitch = @player.pitchings.pluck(:BFP)
    pitch.reduce(:+)
  end

  def GF
    pitch = @player.pitchings.pluck(:GF)
    pitch.reduce(:+)
  end

  def R
    pitch = @player.pitchings.pluck(:W)
    pitch.reduce(:+)
  end

  def SH
    pitch = @player.pitchings.pluck(:SH)
    pitch.reduce(:+)
  end

  def SF
    pitch = @player.pitchings.pluck(:SF)
    pitch.reduce(:+)
  end

  def GIDP
    pitch = @player.pitchings.pluck(:GIDP)
    pitch.reduce(:+)
  end

  def IP
    pitch = @player.pitchings.pluck(:IPouts)
    pitch.map{|p| p[0]}.reduce(:+).to_f / 3
  end

  def WHIP
    pitch = @player.pitchings.pluck(:BB, :H)
    (pitch.map{|p| p[0]}.reduce(:+) + pitch.map{|p| p[0]}.reduce(:+)).to_f / IP
  end

  def SO9
    pitch = @player.pitchings.pluck(:SO)
    (9 * (pitch.map{|p| p[0]}.reduce(:+)).to_f / IP)
  end

  def H9
    pitch = @player.pitchings.pluck(:H)
    (9 * (pitch.map{|p| p[0]}.reduce(:+)).to_f / IP)
  end

  def BB9
    pitch = @player.pitchings.pluck(:BB)
    (9 * (pitch.map{|p| p[0]}.reduce(:+)).to_f / IP)
  end
  private
  def single
    bats = @player.battings.pluck(:H, :"2B", :"3B", :HR)
    bats.map{|b| b[0]}.reduce(:+) - (bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+) + bats.map{|b| b[3]}.reduce(:+).to_f)
  end
end