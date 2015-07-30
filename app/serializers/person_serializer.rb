class PersonSerializer < ActiveModel::Serializer
  attributes :nameFirst, :nameLast, :bats, :throws, :debut, :height, :weight
  has_many :battings
end
