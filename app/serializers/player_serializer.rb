class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :nameFirst, :nameLast, :nameGiven, :birthDay, :birthMonth, :birthYear, :birthState, :birthCity
  attributes :weight, :height, :bats, :throws, :debut

  url :player
end
