FactoryGirl.define do
  factory :batting do
    player
    player_id {SecureRandom.uuid}
    G "1"
    AB "1"
  end
end