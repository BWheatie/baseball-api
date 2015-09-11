FactoryGirl.define do
  factory :pitching do
    player

    factory :pitching_w_required do
      G { 1 }
    end
  end
end
