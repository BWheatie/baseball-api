class Report
  extend ActiveModel::Naming
  include ActiveModel::Serialization
  def initialize player
    @player = player
  end

  def id
    SecureRandom.uuid
  end

  def BA
    bats = @player.battings.pluck(:H, :AB)
    bats.map{|b| b[0]}.reduce(:+) / bats.map{|b| b[1]}.reduce(:+).to_f
  end

  def SLG
    bats = @player.battings.pluck(:"2B", :"3B", :HR, :AB)
    (single + (bats.map{|b| b[0]}.reduce(:+)*2) + (bats.map{|b| b[1]}.reduce(:+)*3) + (bats.map{|b| b[2]}.reduce(:+)*4)) /
    (bats.map{|b| b[3]}.reduce(:+).to_f)
  end

  def OBP
    bats = @player.battings.pluck(:H, :BB, :HBP, :AB, :SF)
    (bats.map{|b| b[0]}.reduce(:+) + bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+)) /
    (bats.map{|b| b[3]}.reduce(:+) + bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+) + bats.map{|b| b[4]}.reduce(:+).to_f)
  end

  def OPS
    self.SLG + self.OBP
  end

  private
  def single
    bats = @player.battings.pluck(:H, :"2B", :"3B", :HR)
    bats.map{|b| b[0]}.reduce(:+) - (bats.map{|b| b[1]}.reduce(:+) + bats.map{|b| b[2]}.reduce(:+) + bats.map{|b| b[3]}.reduce(:+).to_f)
  end
end