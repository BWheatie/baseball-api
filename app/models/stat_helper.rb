class StatHelper
  def self.sum_pitching_stat(player, stat)
    pitch = player.pitchings.pluck(stat)
    map_reject_reduce(pitch)
  end

  def self.sum_batting_stat(player, stat)
    bats = player.battings.pluck(stat)
    map_reject_reduce(bats)
  end

  def self.sum_fielding_stat(player, stat)
    field = player.fieldings.pluck(stat)
    map_reject_reduce(field)
  end

  def self.sum_appearance_stat(player, stat)
    appears = player.appearances.pluck(stat)
    map_reject_reduce(appears)
  end

  private

  def self.map_reject_reduce arr
    arr.map do |p|
      if p.kind_of? Array
        p[0] ? p[0] : 0
      else
        p
      end
    end.reject{|p| p.nil?}.reduce(0, :+)
  end
end