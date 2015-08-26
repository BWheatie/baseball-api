class PitchingCareer
  def IP
    self.IPouts / 3
  end

  def WHIP
    (self.BB + self.H) / IP
  end

  def K/9
    self.K / IP
  end

  def H/9
    9 * (self.H / IP)
  end

end