class Report
  extend ActiveModel::Naming
  include ActiveModel::Serialization
  def initialize player
    @player = player
  end

  def id
    SecureRandom.uuid
  end

  def uuid
    SecureRandom.uuid
  end
end