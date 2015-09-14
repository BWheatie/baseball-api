FactoryGirl.define do
  factory :pitching do
    player

    factory :pitching_w_required do
      pitching_games { 1 }
    end
  end
end
