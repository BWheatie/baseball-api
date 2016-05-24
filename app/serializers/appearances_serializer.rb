class AppearancesSerializer < ApplicationSerializer
  attributes :all_games, :games_started, :games_batting, :games_defense, :games_pitched, :games_catcher, :games_firstbase,
      :games_secondbase, :games_thirdbase, :games_shortstop, :games_leftfield, :games_centerfield,
      :games_rightfield, :games_outfield, :games_designatedhitter, :games_pinchhitter, :games_pinchrunner
end