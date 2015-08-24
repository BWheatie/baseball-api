class BattingCareer
  def BA
    self.H / self.AB
  end

  def single
    self.H - (self.2B + self.3B + self.HR)
  end

  def SLG
    (single + (2B * 2) + (3B * 3) + (HR * 4)) / AB
  end

  def OBP
    (self.H + self.BB + self.HBP) / (self.AB + self.BB + self.HBP + self.SF)
  end

  def OPS
    SLG + OBP
  end
end