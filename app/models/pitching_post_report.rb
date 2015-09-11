module PitchingPostReport
  include PitchingReport
  def WHIPpost
    self.WHIP
  end

  def SO9post
    self.S09
  end

  def H9post
    self.H9
  end

  def BB9post
    self.BB9
  end
end