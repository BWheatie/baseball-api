class AppearancesReportSerializer < Activemodel::Serializer
  attributes :G_all, :GS, :G_batting :G_defense, :G_p, :G_c, :G_1b, :G_2b, :G_3b, :G_ss, :G_lf, :G_cf, :G_rf, :G_rf, :G_of, :G_dh, :G_ph, :G_pr
  belongs_to :report

end