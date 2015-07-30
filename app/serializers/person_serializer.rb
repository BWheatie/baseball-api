class PersonSerializer < ActiveModel::Serializer
  attributes :nameFirst, :nameLast, :bats, :throws, :debut, :height, :weight
end
