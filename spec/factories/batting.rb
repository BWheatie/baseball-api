FactoryGirl.define do
  factory :batting do
    player

    factory :batting_w_required do
      G { 1 }
      AB { 1 }
    end
  end
end