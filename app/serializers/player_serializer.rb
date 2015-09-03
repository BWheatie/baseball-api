class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name_first, :name_last, :name_given, :birth_day, :birth_month, :birth_year, :birth_state, :birth_city
  attributes :weight, :height, :bats, :throws, :debut
  has_one :report
  url :player
end
