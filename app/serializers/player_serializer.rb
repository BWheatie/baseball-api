class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :nameFirst, :nameLast, :nameGiven, :birthDay, :birthMonth, :birthYear, :birthState, :birthCity
  attributes :weight, :height, :bats, :throws, :debut
  has_many :battings, :fieldings, :pitchings
  url :player
end
