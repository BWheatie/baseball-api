module AppearancesReport
  def self.required_attrs
    [:all_games]
  end

  def self.optional_attrs
    [:games_started, :games_batting, :games_defense, :games_pitched, :games_catcher, :games_firstbase,
      :games_secondbase, :games_thirdbase, :games_shortstop, :games_leftfield, :games_centerfield,
      :games_rightfield, :games_outfield, :games_designatedhitter, :games_pinchhitter, :games_pinchrunner]
  end

  (self.required_attrs + self.optional_attrs).each do |start|
    define_method(start) do
      StatHelper.sum_appearance_stat(@player, start)
    end
  end
end