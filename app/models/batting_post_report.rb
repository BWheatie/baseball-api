module BattingPostReport
  include BattingReport

  def AVGpost
    self.AVG
  end

  def SLGpost
    self.SLG
  end

  def OBPpost
    self.OBP
  end

  def OPSpost
    self.SLGpost + self.OBPpost
  end

  def ISOpost
    self.SLGpost - self.AVGpost
  end

  def BABIPpost
    self.BABIP
  end

  def PApost
    self.PA
  end

  def TBpost
    self.TB
  end
end