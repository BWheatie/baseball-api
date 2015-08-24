class PlayerCareer < Player
  def batting_average
    self.H/self.AB
    return.to_i
  end
end