class PlayerSerializer < ActiveModel::Serializer
  attributes :nameFirst, :nameLast, :nameGiven, :birthDay, :birthMonth, :birthYear, :birthState, :birthCity, :weight, :height,:bats, :throws, :debut
end
