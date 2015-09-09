module AppearancesReport
  def self.required_attrs
    [:G_all]
  end

  def self.optional_attrs
    [:GS, :G_batting, :G_defense, :G_p, :G_c, :G_1b, :G_2b, :G_3b, :G_ss, :G_lf, :G_cf, :G_rf, :G_rf, :G_of, :G_dh, :G_ph, :G_pr]
  end

  (self.required_attrs + self.optional_attrs).each do |start|
    define_method(start) do
      sum_games_start(start)
    end
  end


  def sum_games_start(appearances)
    games = @player.appearances.pluck(appearances)
    games.reduce(:+)
  end
end