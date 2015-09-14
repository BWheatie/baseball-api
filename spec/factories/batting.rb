FactoryGirl.define do
  factory :batting do
    player

    factory :batting_w_required do
      games { 1 }
      atbats { 1 }
    end
  end
end