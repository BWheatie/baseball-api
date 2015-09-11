class ReportSerializer < ApplicationSerializer
  optional_attribute :batting, :batter?, BattingSerializer
  optional_attribute :pitching, :pitcher?, PitchingSerializer
  optional_attribute :fielding, :fielder?, FieldingSerializer
  optional_attribute :battingpost, :post_batter?, BattingPostSerializer
  optional_attribute :pitchingpost, :post_pitcher?, PitchingPostSerializer
  optional_attribute :fieldingpost, :post_fielder?, FieldingPostSerializer
  optional_attribute :appearances, :appears?, AppearancesSerializer
end
