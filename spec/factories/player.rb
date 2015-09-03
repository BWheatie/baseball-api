FactoryGirl.define do
  factory :player do
    name_first {Faker::Name.first_name}
    name_last {Faker::Name.last_name}
  end
end
