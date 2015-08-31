class Comparison
  def initialize report
    @report = report
  end

  def batting_score
    score = (@report.G / 20.0) + (@report.AB / 75.0) + (@report.R / 10.0) + (@report.H / 15.0) + (@report.Double / 5.0)
    score += (@report.Triple / 4.0) +(@report.HR / 2.0) + (@report.RBI / 10.0) + (@report.BB / 25.0) + (@report.SO / 150.0)
    score += (@report.SB / 20.0) + (@report.AVG / 0.001) + (@report.SLG / 0.002).to_f
  end
end

# One point for each difference of 20 games played.
# One point for each difference of 75 at bats.
# One point for each difference of 10 runs scored.
# One point for each difference of 15 hits.
# One point for each difference of 5 doubles.
# One point for each difference of 4 triples.
# One point for each difference of 2 home runs.
# One point for each difference of 10 RBI.
# One point for each difference of 25 walks.
# One point for each difference of 150 strikeouts.
# One point for each difference of 20 stolen bases.
# One point for each difference of .001 in batting average.
# One point for each difference of .002 in slugging percentage.