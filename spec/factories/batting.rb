FactoryGirl.define do
  factory :batting do
    player

    factory :batting_w_required do
      G { 1 }
      AB { 1 }
    end

    factory :single_stats do
      HR {[1, 2, 1, 4, 2]}
    end
  end
end